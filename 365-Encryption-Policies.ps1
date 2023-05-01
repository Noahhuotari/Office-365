#AADRM is depricated. Use the AIPService modules
Install-Module aipservice -Verbose -AllowClobber

#Connect to the AIP Endpoint in Azure
Connect-AipService

#Get commands available in this module
Get-Command -Module AIPService

#Show the permissions that can be set against items
Get-AipServiceTemplate | FL

#Export templates in case they are needed again
$templates = Get-AipServiceTemplate | Where-Object {$_.TemplateID.guid -eq "1038f770-45a7-4dc3-98c0-af6d2928a1b9" -or $_.TemplateID.guid -eq "df59b394-7e52-4e7b-9551-a952ee5187d1"}
$templates
mkdir c:\hbs
Export-AipServiceTemplate -TemplateId 1038f770-45a7-4dc3-98c0-af6d2928a1b9 -Path C:\HBS\confidential_all_employees.txt
Export-AipServiceTemplate -TemplateId df59b394-7e52-4e7b-9551-a952ee5187d1 -Path C:\HBS\highly_confidential_all_employees.txt

#remove the templates you do not want available to end users
Remove-AipServiceTemplate -TemplateId 1038f770-45a7-4dc3-98c0-af6d2928a1b9
Remove-AipServiceTemplate -TemplateId df59b394-7e52-4e7b-9551-a952ee5187d1

#Disconnect from the endpoint
Disconnect-AipService

#Give it at least a couple hours before verifying.
