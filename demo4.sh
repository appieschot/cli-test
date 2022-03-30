curl -L -o /usr/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && \
  chmod +x /usr/bin/jq

m365 login --authType identity --userName $1
externalUsers=`m365 spo user list --webUrl $2 --output json --query "[?contains(LoginName,'#ext#')]"`

for externalUser in `echo $externalUsers | jq -c '.[]'`; do

    externalUserMail=`echo $user | jq '.Email'`

    m365 aad user hibp --userName $externalUserMail --apiKey $3 --verbose

done
