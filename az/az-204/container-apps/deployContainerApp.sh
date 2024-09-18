resourceGroupName="1-674c4a7d-playground-sandbox"
location="westus"
contApp_ENV_Name="labaz204-env-30713"
contApp_NAME="az204lab-mycontainerapp"

az containerapp create -n $contApp_NAME -g $resourceGroupName --environment $contApp_ENV_Name --image mcr.microsoft.com/azuredocs/containerapps-helloworld:latest --target-port 80 --ingress 'external' --query properties.configuration.ingress.fqdn