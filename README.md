# Clyde — Cybersecurity Home Lab

**An enterprise-style virtual network and security monitoring environment built for hands-on learning, troubleshooting, and cybersecurity skill development.**

## Project Overview

Clyde is my senior capstone project for the Cybersecurity and Networking program at Weber State University. I built this home lab to gain practical experience with technologies used in enterprise IT and cybersecurity environments.

The goal is to create a network where I can configure servers, manage users, test security controls, investigate problems, and learn from mistakes without affecting the devices on my home network.

Rather than working through isolated exercises, I wanted a lab where the different systems interact and where I can practice troubleshooting issues across an entire environment.

**Project Status:** In Progress — Fall 2026

## Technologies Used

| Technology | Purpose |
|---|---|
| Proxmox VE | Virtualization platform hosting the lab |
| pfSense | Firewall, routing, and network isolation |
| Windows Server | Active Directory Domain Services, DNS, and DHCP |
| Windows 11 | Domain-joined workstation and monitored endpoint |
| Ubuntu Server | Linux server administration |
| Wazuh | Security monitoring, log collection, and alert investigation |
| SSH | Remote server administration |

## Lab Architecture

Clyde runs on a dedicated mini PC using Proxmox VE. The environment contains multiple virtual machines connected through a virtual network.

The lab uses a separate internal subnet (`10.10.10.0/24`) with pfSense controlling traffic between the lab and external networks.

This design allows the virtual machines to communicate with each other while keeping the lab separated from my everyday home devices.

### Virtual Machines

| VM | Role |
|---|---|
| VM101 | pfSense firewall and router |
| VM102 | Ubuntu Server |
| VM103 | Windows Server domain controller |
| VM104 | Windows 11 domain-joined client |
| VM105 | Ubuntu Server running Wazuh |

## Project Milestones

### 1. Virtualization Foundation — Complete

Installed and configured Proxmox VE on a dedicated mini PC. Created virtual machines and configured virtual hardware, storage, and network interfaces.

### 2. Isolated Virtual Network — Complete

Configured virtual networking and pfSense to create a separate lab environment. Implemented firewall rules and routing to control network access.

### 3. Windows Domain Environment — Operational

Installed Windows Server and configured Active Directory, DNS, and DHCP.

Joined a Windows 11 workstation to the domain and tested domain authentication and user access.

### 4. Linux Server Administration — Operational

Deployed Ubuntu Server and practiced Linux administration, SSH access, web server configuration, and firewall management.

### 5. Security Monitoring with Wazuh — In Progress

Deployed Wazuh on Ubuntu Server and installed a Wazuh agent on the Windows 11 workstation.

Verified that the agent communicates with the Wazuh server and that the dashboard receives Windows system events and security alerts.

Investigated a Windows authentication-related event involving communication with the domain controller.

**Next step:** Generate controlled security events, investigate the resulting alerts, and document the findings.

## Skills Developed

- Virtual machine deployment and administration
- Network segmentation, routing, and firewall configuration
- Windows Server and Active Directory administration
- Linux server administration
- Endpoint monitoring and security event analysis
- Troubleshooting authentication and network connectivity problems
- Technical documentation and project planning

## Current Work

The current focus is expanding security monitoring and practicing basic Security Operations Center (SOC) workflows using Wazuh.

Future work may include additional endpoint monitoring, security hardening, detection testing, and automation.

## Documentation

This repository will be updated with network diagrams, configuration notes, selected screenshots, troubleshooting examples, and security investigation reports as the project progresses.

All published materials will be reviewed to avoid exposing credentials or sensitive configuration information.

## About This Project

I am a Cybersecurity and Networking student at Weber State University, graduating in December 2026. Clyde is both my senior capstone and an ongoing learning environment that I plan to continue developing after graduation.

My goal is to transition into enterprise IT and cybersecurity, with a particular interest in security operations, network administration, and troubleshooting.
