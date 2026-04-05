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
Day 5: Created users via powershell script in each OU, Installing Azure AD connect
Day 6: Azure AD connect Installed and setup. Was able to see all the users from on-prem showing in cloud
Day 7: Logic App (la-workday-ad-provisioning) built and working
   
   Flow:
   Recurrence (every 1 hour)
   → HTTP GET (Graph API) - fetches users created in last hour
   → Parse JSON - breaks response into readable fields
   → For Each - loops through each user
   → Condition - checks department field
      ├── Finance → GRP-Finance-Cloud 
      ├── HR → GRP-HR-Cloud 
      ├── IT → GRP-IT-Cloud 
      └── Sales → GRP-Sales-Cloud 

   Challenges solved:
   - Schema validation failing on null departments
   - Condition reading department as plain text vs expression
   - MSA account not supported by Add user to group connector
   - Switched to HTTP action with Graph API directly
   - Fixed forbidden error by adding GroupMember.ReadWrite.All permission

     Day 8: Logic App working - all 4 departments assigning correctly


   Authentication:
   - App Registration created (logicapp-graphapi)
   - Client ID, Tenant ID, Secret configured
   - API Permissions: User.Read.All, GroupMember.ReadWrite.All
     Day 9:  Logic App working - all 4 departments assigning correctly
     Day 10: - MgGraph PowerShell scripting - filtering and updating users


