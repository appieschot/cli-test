m365 cli config set --key showSpinner --value false &>/dev/null

m365 login --authType identity --userName $1
m365 aad o365group recyclebinitem list --output json
