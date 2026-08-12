import os
import json
import re
from groq import Groq

# Initialize the Groq client. It expects the GROQ_API_KEY environment variable.
client = Groq(api_key=os.environ.get("GROQ_API_KEY"))

def read_file(filepath):
    """Utility function to read file contents."""
    with open(filepath, "r") as f:
        return f.read()

def write_file(content, filepath):
    """Utility function to overwrite a file with new content."""
    with open(filepath, "w") as f:
        f.write(content)

def extract_failed_checks(report_path="checkov-report.json"):
    """Parse the Checkov JSON report to find exactly what failed."""
    if not os.path.exists(report_path):
        return "No Checkov report found. Please analyze the code for general security misconfigurations."
    
    try:
        with open(report_path, "r") as f:
            report = json.load(f)
            
        # Checkov output can be a list (multiple frameworks) or a dict. Handle safely.
        if isinstance(report, list):
            report = report[0]
            
        failed_checks = []
        for check in report.get("results", {}).get("failed_checks", []):
            failed_checks.append(f"- {check.get('check_id')}: {check.get('check_name')} (Resource: {check.get('resource')})")
            
        return "\n".join(failed_checks)
    except Exception as e:
        print(f"Error parsing Checkov report: {e}")
        return "Could not parse Checkov report. Analyze the raw code."

def main():
    print("Starting AI Auto-Remediation process...")
    
    # 1. Gather context
    tf_code = read_file("main.tf")
    failed_checks = extract_failed_checks()
    
    print(f"Detected vulnerabilities:\n{failed_checks}")

    # 2. Construct the prompt for the LLM
    prompt = f"""
    You are a Senior DevSecOps AI Agent.
    A Checkov security scan failed on the following Azure Terraform code.
    
    Failed Checks:
    {failed_checks}
    
    Current Terraform Code (main.tf):
    {tf_code}
    
    Your task:
    1. Fix the security vulnerabilities mentioned in the failed checks.
    2. Ensure 'public_network_access_enabled' is false or removed appropriately.
    3. Ensure 'allow_nested_items_to_be_public' is false.
    4. Return ONLY the completely fixed Terraform code.
    5. DO NOT include any explanations, markdown blocks (like ```hcl), or conversational text. Output pure HCL code.
    """

    print("Sending code and context to Groq API...")
    
    # 3. Call the LLM
    response = client.chat.completions.create(
        messages=[{"role": "user", "content": prompt}],
        model="llama3-8b-8192", 
        temperature=0.1 # Low temperature for deterministic, technical output
    )

    fixed_code = response.choices[0].message.content.strip()

    # 4. Fallback cleanup in case the LLM ignores instructions and adds markdown
    fixed_code = re.sub(r"^```(hcl|terraform)?\n", "", fixed_code, flags=re.MULTILINE)
    fixed_code = re.sub(r"```$", "", fixed_code).strip()

    # 5. Overwrite the original file with the secure code
    write_file(fixed_code, "main.tf")
    print("Remediation complete. main.tf has been overwritten with secure code.")

if __name__ == "__main__":
    main()