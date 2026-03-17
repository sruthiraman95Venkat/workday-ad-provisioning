while ($firstName -inotlike "Null*") {
$firstName =Read-Host "Enter the FirstName"
$lastName = Read-Host "Enter the last name"
$Department = Read-Host "Enter the Department Name"
$SamAccountName = Read-Host "Enter the sam AccountName"
if($firstName -ilike "Null"){
break
}
elseif($Department -like "*HR*") {
        New-ADUser -Name "$FirstName $LastName" -Department $Department -Path "OU=HR-Users,DC=TESTLAB,DC=LOCAL" -SamAccountName $SamAccountName
        Write-Output "User has been created under HR OU"
    } elseif($Department -like "*IT*")
    {
    New-ADUser -Name "$FirstName $LastName" -Department $Department -Path "OU=IT-Users,DC=TESTLAB,DC=LOCAL" -SamAccountName $SamAccountName
    Write-Output "User has been created under IT OU"
    } elseif($Department -like "*sales*") {
New-ADUser -Name "$FirstName $LastName" -Department $Department -Path "OU=Sales-Users,DC=TESTLAB,DC=LOCAL" -SamAccountName $SamAccountName
Write-Output "User has been created under Sales OU"
} elseif($Department -like "*Finance*") {
New-ADUser -Name "$FirstName $LastName" -Department $Department -Path "OU=Finance-Users,DC=TESTLAB,DC=LOCAL" -SamAccountName $SamAccountName
Write-Output "User has been created under Finance OU"
} }
