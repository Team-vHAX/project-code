If (Test-path "/root/.local/share/powershell/Modules/AsBuiltReport.VMware.NSX-T/") {
    "Loaded mapped/shared AsBuiltReport.VMware.NSX-T module."
    Import-module /root/.local/share/powershell/Modules/AsBuiltReport.VMware.NSX-T/AsBuiltReport.VMware.NSX-T.psd1 -WarningAction SilentlyContinue -ErrorAction SilentlyContinue | Out-Null
} elseif (Test-path "/tmp/AsBuiltReport.VMware.NSX-T/AsBuiltReport.VMware.NSX-T.psd1") {
    import-module /tmp/AsBuiltReport.VMware.NSX-T/AsBuiltReport.VMware.NSX-T.psd1 -WarningAction SilentlyContinue -ErrorAction SilentlyContinue | Out-Null
    "Loaded fallback (/tmp) copy of AsBuiltReport.VMware.NSX-T likely older than latest."
} else {
    "No copy of AsBuiltReport.VMware.NSX-T found something went wrong."
}

$env:PSModulePath += ":/tmp/AsBuiltReport.VMware.NSX-T/"

Import-module AsBuiltReport.Core -WarningAction SilentlyContinue -ErrorAction SilentlyContinue | Out-Null
Import-module VMware.PowerCLI -WarningAction SilentlyContinue -ErrorAction SilentlyContinue | Out-Null
Import-module NSXT -WarningAction SilentlyContinue -ErrorAction SilentlyContinue | Out-Null
Write-host "vHAX proile loaded."