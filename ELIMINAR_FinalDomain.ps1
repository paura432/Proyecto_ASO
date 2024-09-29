Remove-ADOrganizationalUnit -Identity "ou=FinalDomain,dc=TheFinal,dc=Domain" -Recursive -Confirm:$false
Remove-Item -Path "E:\FinalDomain" -Confirm:$false