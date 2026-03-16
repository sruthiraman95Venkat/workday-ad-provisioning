$GroupName = Read-Host "Enter the Group Name"
if($GroupName -like "*Fin*") {
New-ADGroup -Name $GroupName -Path "OU=Finance-Users,DC=TESTLAB,DC=LOCAL" -GroupScope Global
} elseif ($GroupName -like "*HR*") {
New-ADGroup -Name $GroupName -Path "OU=HR-Users,DC=TESTLAB,DC=LOCAL" -GroupScope Global
Write-Output "HR Group created"
} elseif ($GroupName -like "*Sales*") {
New-ADGroup -Name $GroupName -Path "OU=Sales-Users,DC=TESTLAB,DC=LOCAL" -GroupScope Global
Write-Output "Sales Group created"
} elseif ($GroupName -like "*IT*") {
New-ADGroup -Name $GroupName -Path "OU=IT-Users,DC=TESTLAB,DC=LOCAL" -GroupScope Global
Write-Output "IT Group created"
} else {
}
