#This script will deploy an azure storage account policy based on a given policy writed on a separate json file
#The policy will move all the blob files within 'sample-container/log' path to cool access tier, which their last modifcation were 30 days ago

#param
storageAccountName="teastusstgacc204"
resourceGroupName="1-aeed2ffe-playground-sandbox"

az login
az storage account management-policy create --account-name $storageAccountName --policy @stg_policy.json --resource-group $resourceGroupName