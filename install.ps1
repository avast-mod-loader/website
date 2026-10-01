$ErrorActionPreference = "Stop"

$AvastVersion = "0.0.1"

function Show-Box {
    param([string]$Text)
    $border = "+" + ("-" * ($Text.Length + 2)) + "+"
    Write-Output $border
    Write-Output "| $Text |"
    Write-Output $border
}

function Invoke-Pause {
    Read-Host "press enter to continue" | Out-Null
    Write-Output ""
}

Show-Box "AVaSt v${AvastVersion}"
Show-Box "powered by GDPatch"

$OS = "windows"
if ($IsLinux) { $OS = "linux" }
elseif ($IsMacOS) { $OS = "macos" }
Show-Box "test: detected OS is ${OS}"

$Desktop = [Environment]::GetFolderPath("Desktop")
$TestFile = Join-Path $Desktop "avast_test.txt"
"AVaSt v${AvastVersion} test file`n" | Out-File -FilePath $TestFile -Encoding ascii -NoNewline
Show-Box "test: wrote ${TestFile}"

Invoke-Pause

Remove-Item $TestFile -Force
Show-Box "test: removed ${TestFile}"
Show-Box "test: installer not implemented yet"
