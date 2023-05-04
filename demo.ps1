m365 cli config set --key showSpinner --value $false
# m365 login --authType identity --userName $env:M365_USER

try {
    Write-Host "Hello World" + $1
    Write-Host "Hello World" + $env:M365_USER
}
catch {
    Write-Host "Error: $_"
    exit 1
}
