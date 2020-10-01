Set-PowerCLIConfiguration -Scope AllUsers -ParticipateInCEIP $false -Confirm:$false  -WarningAction SilentlyContinue
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Scope AllUsers -Confirm:$false -WarningAction SilentlyContinue

$env:PSModulePath += ":/tmp/AsBuiltReport.VMware.NSX-T/"

Write-host "Setup.ps1 completed"
