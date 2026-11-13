import json
import subprocess
import sys

filename = sys.argv[1] if len(sys.argv) > 1 else "sanitized_event.json"

with open(filename) as f:
    event = json.load(f)

level = int(event["level"])
if level <= 6:
    severity = "Low"
elif level <= 11:
    severity = "Medium"
else:
    severity = "High"

print(f"Wazuh Level {level}: {severity} Severity")

with open("security_prompt.txt") as f:
    prompt = f.read()

prompt += "\n" + json.dumps(event)
prompt += f"\nVerified severity: {severity}"

result = subprocess.run(
    ["ollama", "run", "qwen2.5:3b"],
    input=prompt,
    text=True,
    capture_output=True,
)

print(result.stdout)
