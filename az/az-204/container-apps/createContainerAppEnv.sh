resourceGroupName="1-674c4a7d-playground-sandbox"
location="westus"
contAppEnvName="labaz204-env-${RANDOM}"

#Create container app environment
echo "Deploying Az Container App Environment - ${contAppEnvName}"
az containerapp env create -n $contAppEnvName -g $resourceGroupName -l $location