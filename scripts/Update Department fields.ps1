$ObjectIDs = @(Get-MgUser -All -Property DisplayName,Department,Id,UserPrincipalName | where-object Department -eq $null).ID
foreach ($ObjectID in $ObjectIDs) {
    try {
        update-MgUser -UserId $ObjectID -Department "IT"
    } catch {
        Write-Host "Failed to update for $ObjectID"
    }
}
