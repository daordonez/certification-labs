location="eastus"
rgName="1-b3081f55-playground-sandbox"
templateURI="https://raw.githubusercontent.com/Azure-Samples/azure-event-grid-viewer/main/azuredeploy.json"
#Event grid params
myTopicName="az204-eglab"
siteName="az204-eventgridep-${RANDOM}"


echo "Landing Az deployment from remote source"
az deployment group create --resource-group $rgName --template-uri  $templateURI --parameters siteName=$siteName hostingPlanName=viewerhost