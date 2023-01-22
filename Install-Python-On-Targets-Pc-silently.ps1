# to install python in windows silently use these commands
# Open PowerShell as a administrator mode
# Run this
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
# then run this
choco install python --version=3.10.1 --params "/InstallDir:C:\Python3 /AddToPath:1" -y
# and run this for last time
[Environment]::GetEnvironmentVariable("Path","User")
