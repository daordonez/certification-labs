resourceGroupName="1-674c4a7d-playground-sandbox"
acrName="labaz204mypersonalacr"

echo "Creating ACR: ${acrName} into: ${resourceGroupName}"
az acr create -g $resourceGroupName -n $acrName --sku Basic