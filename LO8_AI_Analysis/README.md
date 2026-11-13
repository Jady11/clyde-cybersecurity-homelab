
# LO8 — Local AI-Assisted Security Analysis

## Overview

This project demonstrates how a locally hosted AI model can assist with analyzing security alerts from a Wazuh monitoring environment.

The goal is to supplement traditional security monitoring with AI-generated explanations and investigation recommendations.

## Tools Used

- Wazuh SIEM — Security event collection and monitoring
- Python 3 — JSON processing and severity classification
- Ollama — Local AI model runtime
- Qwen 2.5 (3B) — Security event analysis

## How It Works

1. Export a security event from Wazuh.
2. Sanitize the JSON to remove identifying information.
3. Run the Python analysis script against the JSON file.
4. Python classifies the alert severity.
5. Ollama runs Qwen locally to generate a security analysis.

The current workflow uses manually prepared JSON files. It does not automatically retrieve events from Wazuh.

## Testing

### Test 1 — Actual Wazuh Event

- Rule ID: 5503
- Description: PAM user login failure
- Wazuh Level: 5
- Python Classification: Low
- AI Assessment: Low

### Test 2 — Simulated Security Event

- Description: Simulated repeated authentication failures
- Test Level: 10
- Python Classification: Medium
- AI Assessment: Medium

Both tests used the same Python script without code modifications.

## Limitations

- AI-generated conclusions require human verification.
- Qwen produced inconsistent severity classifications during earlier testing.
- Python provides a deterministic severity classification.
- AI-generated explanations can include unsupported assumptions.
- The script processes one JSON event per execution.
- Wazuh event retrieval and sanitization are currently manual.

## Running the Script

```bash
python3 analyze_event.py sanitized_event.json
```

For the simulated event:

```bash
python3 analyze_event.py test_event_02.json
```

## Conclusion

This project demonstrates a working local AI-assisted security analysis workflow. Python provides consistent severity classification while Qwen generates explanations and investigation recommendations.

The tests also demonstrate why AI-generated security assessments should be reviewed rather than accepted without verification.

