m365 cli config set --key showSpinner --value false
# m365 login --authType identity --userName $env:M365_USER

Write-Host "Hello World"
Write-Host "Hello World" + $env:M365_USER
