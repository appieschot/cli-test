m365 setup --scripting --output none

m365 login --authType identity --userName $1
m365 spo user list --webUrl $2 --output json --query "[?contains(LoginName,'#ext#')]"

