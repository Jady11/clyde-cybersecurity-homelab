# CYBR 4790 - Active Directory Health Check
# Learning Outcome 7: Automation and Scripting
# Purpose: Automate basic Active Directory health checks
# Server: DC01
# Domain: clyde.test

$ReportDate = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Create a timestamped report file
$FileDate = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$ReportPath = Join-Path $PSScriptRoot "AD-HealthCheck_$FileDate.txt"

Start-Transcript -Path $ReportPath

Write-Host "======================================="
Write-Host "ACTIVE DIRECTORY HEALTH CHECK"
Write-Host "======================================="
Write-Host "Domain: $((Get-ADDomain).DNSRoot)"
Write-Host "Report Date: $ReportDate"
Write-Host ""

# Check 1: Active Directory Domain Information

Write-Host "CHECK 1: ACTIVE DIRECTORY DOMAIN"
Write-Host "------------------------------------------"

$Domain = Get-ADDomain

Write-Host "Domain Name: $($Domain.DNSRoot)"
Write-Host "NetBIOS Name: $($Domain.NetBIOSName)"
Write-Host "Domain Controller: $($Domain.PDCEmulator)"
Write-Host ""

# Check 2: Domain Controller Services

Write-Host "CHECK 2: DOMAIN CONTROLLER SERVICES"
Write-Host "------------------------------------------"

$Services = @("NTDS", "DNS", "Netlogon")

foreach ($Service in $Services) {
	$Status = Get-Service -Name $Service
	Write-Host "$($Status.DisplayName): $($Status.Status)"
}

Write-Host ""

# Check 3: Active Directory User Account Status

Write-Host "CHECK 3: USER ACCOUNT STATUS"
Write-Host "------------------------------------------"

# Replace with an existing Active Directory username before running
$TargetUser = "exampleuser"

$User = Get-ADUser -Filter "SamAccountName -eq '$TargetUser'" -Properties Enabled,LockedOut

if ($null -ne $User) {
	Write-Host "User: $($User.SamAccountName)"
	Write-Host "Enabled: $($User.Enabled)"
	Write-Host "Locked Out: $($User.LockedOut)"
}
else {
	Write-Host "User '$TargetUser' was not found in Active Directory."
}
Write-Host ""

# End the health-check report
Stop-Transcript


