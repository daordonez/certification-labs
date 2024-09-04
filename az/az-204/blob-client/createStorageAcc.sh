#The purpose of this script is create an azure storage account in the 'Standard_LRS' level.

#CONST
resourceLoaction="southcentralus"
resourceGroupName="1-b6dbf06f-playground-sandbox"
stgAccountName="labaz204stgclient"

az storage account create -g $resourceGroupName -n $stgAccountName -l $resourceLoaction --sku Standard_LRS