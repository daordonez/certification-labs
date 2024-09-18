location="eastus"
rgName="1-b3081f55-playground-sandbox"
mySiteURL="https://az204-eventgridep-16790.azurewebsites.net"
endpoint="${mySiteURL}/api/updates"
subscriptionName="az204ViewerSub"
myTopicName="az204-eglab"

echo "Creating subscription - ${subscriptionName}"
echo "Fetching subscription id"
subID=$(az account show --subscription "" | jq -r '.id')

sourceID="/subscriptions/${subID}/resourceGroups/${rgName}/providers/Microsoft.EventGrid/topics/${myTopicName}"

echo "Creating subscription - ${subscriptionName}"
az eventgrid event-subscription create --source-resource-id $sourceID --name $subscriptionName --endpoint $endpoint