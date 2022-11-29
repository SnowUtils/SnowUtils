Set-Location $userprofile
Set-Location Documents

Write-Host 
"
 ____                      _   _ _   _ _
/ ___| _ __   _____      _| | | | |_(_) |___
\___ \| '_ \ / _ \ \ /\ / / | | | __| | / __|
 ___) | | | | (_) \ V  V /| |_| | |_| | \__ \
|____/|_| |_|\___/ \_/\_/  \___/ \__|_|_|___/

"

Write-Host "Firt time running this? Type " -NoNewline
Write-Host "init " -ForegroundColor Green -NoNewline
Write-Host "!"

$ingate = Read-Host -Prompt "Please enter a command"

if ($ingate -eq "init") 
{
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/SnowUtils/SnowUtils/main/uninstall.ps1" -OutFile "./uninstall.ps1"
    mkdir sutils
    Write-Host " "
    Write-Host "sutils initialised! Run this script agan and type install!"
    Set-Location $userprofile
}

if ($ingate -eq "install") 
{
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/SnowUtils/SnowUtils/main/launch.ps1" -OutFile "./launch.ps1"

    Write-Host "Downloading SNOWUtils in folder sutils..."
    Set-Location sutils

    # MathUtils
    Start-Sleep -Seconds 3
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/SnowUtils/MathUtils/main/graphcalc.py" -OutFile "./graphcalc.py"
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/SnowUtils/MathUtils/main/rechteck.py" -OutFile "./rechteck.py"




    Set-Location ..
}

if ($ingate -eq "uninstall") 
{
    ./uninstall.ps1
    Remove-Item -Path ".\uninstall.ps1"
    Write-Host "Utils removed, when no error showed up in the console!"
}

if ($ingate -eq "launch")
{
    Set-Location $userprofile
    Set-Location ./Documents/sutils
    ./launch.ps1
}