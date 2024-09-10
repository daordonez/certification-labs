resourceGroupName="1-a5263cb4-playground-sandbox"
location="westus"
containerName="az204myacipersistentstg"
DNSLabelName="az204-aci-${RANDOM}"
storageAccountName="az204acivol${RANDOM}"
sharedFSName="aci-shared"


#Creating storage account and az file share
#1.1 Create storage account
echo "Creating Storage Account: ${storageAccountName}"
az storage account create -n $storageAccountName -g $resourceGroupName -l $location --sku Standard_LRS
#1.2 Create share
echo "Creating Az file Share: ${sharedFSName}"
az storage share create --account-name $storageAccountName --name $sharedFSName

#Get storage account key
echo "Getting Storage Account primary key..."
STORAGE_KEY=$(az storage account keys list -n $storageAccountName --query "[0].value" -o tsv)

#Deploying ACI with persistent storage demo
echo "Deploying ACI with persistent storage at: ${storageAccountName} - ${sharedFSName}"
az container create -g $resourceGroupName -n $containerName --image mcr.microsoft.com/azuredocs/aci-hellofiles --dns-name-labe $DNSLabelName --ports 80 --azure-file-volume-account-name $storageAccountName --azure-file-volume-account-key $STORAGE_KEY --azure-file-volume-share-name $sharedFSName --azure-file-volume-mount-path /aci/logs