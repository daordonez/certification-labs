resourceGroupName="1-a5263cb4-playground-sandbox"
location="westus"
containerName="az204myacidep"
DNSLabelName="az204-aci-${RANDOM}"

#deploy container via yaml file
az container create -g $resourceGroupName --file aciSecureValue.yaml