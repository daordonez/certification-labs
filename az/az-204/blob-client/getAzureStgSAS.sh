#This script will fetch the account keys for the given Azure Storage Account

#CONST
resourceLoaction="southcentralus"
resourceGroupName="1-b6dbf06f-playground-sandbox"
stgAccountName="labaz204stgclient"

az storage account keys list -g $resourceGroupName -n $stgAccountName --query "[].{keyName:keyName, value:value}" -o table