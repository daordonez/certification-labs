resourceGroupName="1-a5263cb4-playground-sandbox"
location="westus"
containerName="az204myacidep"
DNSLabelName="az204-aci-${RANDOM}"

#creating ACI "Hello World" sample
az container create -g $resourceGroupName --name $containerName --image mcr.microsoft.com/azuredocs/aci-helloworld --ports 80 --dns-name-label $DNSLabelName -l $location