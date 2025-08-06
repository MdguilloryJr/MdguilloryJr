 <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Michael Guillory
    LinkedIn        : linkedin.com/in/michaelguillorymhe/
    GitHub          : github.com/mdguilloryjr
    Date Created    : 2025-08-06
    Last Modified   : 2025-08-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# Set the registry path
$path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"

# Check if the path exists; create it if it doesn't
if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

# Set the MaxSize value to 00008000 (which is 32768 in decimal)
Set-ItemProperty -Path $path -Name "MaxSize" -Value 0x8000 -Type DWord 
