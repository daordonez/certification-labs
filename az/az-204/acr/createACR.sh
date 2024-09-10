resourceGroupName="1-a5263cb4-playground-sandbox"
acrName="labaz204mypersonalacr"

echo "Creating ACR: ${acrName} into: ${resourceGroupName}"
az acr create -g $resourceGroupName -n $acrName --sku Basic