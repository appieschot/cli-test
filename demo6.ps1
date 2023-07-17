m365 cli config set --key showSpinner --value $false
m365 login --authType identity --userName $env:M365_USER

m365 util accesstoken get --resource https://graph.microsoft.com --new

