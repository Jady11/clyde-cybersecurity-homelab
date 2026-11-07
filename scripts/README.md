# PowerShell Automation

This folder contains PowerShell scripts developed for my CYBR 4790 senior capstone cybersecurity home lab.

## Active Directory Health Check

**Script:** `AD-HealthCheck-Portfolio.ps1`

I created this script to automate several basic Active Directory health checks instead of running each command manually.

The script performs three checks:

1. **Domain Information:** Identifies the Active Directory domain, NetBIOS name, and domain controller.
2. **Domain Controller Services:** Checks whether Active Directory Domain Services (NTDS), DNS, and Netlogon are running.
3. **User Account Status:** Checks whether a specified domain user is enabled or locked out.

## Automation and Reporting

I configured Windows Task Scheduler to run the original health-check script daily on my domain controller.

The script uses PowerShell transcripts to generate timestamped text reports, allowing me to review the results of each execution.

## Testing and Troubleshooting

I tested the script using both an existing Active Directory account and a nonexistent account.

During development, I corrected PowerShell syntax errors, fixed file naming issues, and improved the script to handle a missing user without producing unnecessary errors.

## Requirements

- Windows Server with Active Directory Domain Services
- Windows PowerShell 5.1
- ActiveDirectory PowerShell module
- Appropriate permissions to query Active Directory and local Windows services

## Usage

Before running the portfolio script, update the `$TargetUser` variable with an existing domain username.

Run the script from PowerShell:

```powershell
& ".\AD-HealthCheck-Portfolio.ps1"
```

The script generates a timestamped text report in the same folder as the script.

## Learning Outcome 7

This project demonstrates my experience with PowerShell scripting, Windows Task Scheduler, Active Directory administration, troubleshooting, conditional logic, and automated reporting.
