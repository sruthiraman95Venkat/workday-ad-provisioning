#Workday to AD and AAD provisioning

## Project Overview
Automating user provisioning from Workday to AD (On-prem)  and AAD including automatic group assignments
#Environment:
Azure AD Tenant: sruthiraman95gmail.onmicrosoft.com
On-Pren Domain: testlab.local
## Progress Log
✅ Day 1 - Azure tenant confirmed
⏳ Day 2 - Created 4 users in each department and 4 Security Groups for each department with an additional group for all users.
Day 2 - Setting up VirtualBox and Windows Server 2022 ISO downloaded 
Day 3- Windows Server VM created, Static IP configured, DC01 renamed
VM Configuration:
VM Name: DC01
OS: Windows Server 2022 Standard (Desktop Experience)
IP Address: 192.168.1.10
Subnet Mask: 255.255.255.0
Default Gateway: 192.168.1.1
DNS: 127.0.0.1
Day 4: Installing Active Directory Domain Services, Domain testlab.local created, OU's and Groups created via Powershell script
