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
      <img width="1657" height="584" alt="image" src="https://github.com/user-attachments/assets/0be14d2d-f0f1-43f5-8d24-9ca4c21361a0" />
      <img width="1641" height="704" alt="image" src="https://github.com/user-attachments/assets/0fa96f6a-33d2-4d8f-aec6-078377cd35f7" />
      <img width="1648" height="697" alt="image" src="https://github.com/user-attachments/assets/d5acb058-ef90-4d4e-be11-df35ba794126" />




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
     Day 11- Started with adding On-Prem groups, Created Automation account, Runbook.
     <img width="1361" height="680" alt="image" src="https://github.com/user-attachments/assets/6289da0a-4c60-4596-b526-62895c5200ea" />
     Installing the Azure powershell module inside the onprem VM DC01
     Install-Module -Name Az -Force -AllowClobber
     <img width="1475" height="260" alt="image" src="https://github.com/user-attachments/assets/62f476ef-0eac-4344-9aed-0b279af0a323" />
     Connect- AzAccount from powershell inside DC 
     <img width="1416" height="179" alt="image" src="https://github.com/user-attachments/assets/47ee05e0-ba2a-4410-a5a1-9ce6a4d50ec9" />
     Registering VM as a hybrid Onprem worker
     <img width="1415" height="229" alt="image" src="https://github.com/user-attachments/assets/1830d3f6-b87d-4d16-8b79-22b5ec2772bc" />
✅ Day 12 - Azure VM (DC02) created as Domain Controller
            - OUs, groups and users created via PowerShell
            - Cloud Sync provisioning agent installed on DC02
            - All 4 test users syncing to Entra ID ✅

✅ Day 13 - Full end to end working!
            - On-prem user created in DC02 testlab.local
            - Cloud Sync syncs user to Entra ID
            - Logic App detects user and assigns cloud group
            - Azure Automation Runbook runs on Hybrid Worker
            - On-prem group assigned automatically
            
            <img width="1337" height="744" alt="image" src="https://github.com/user-attachments/assets/5a629002-cb22-4175-8c45-edffd4cb94a1" />



     



