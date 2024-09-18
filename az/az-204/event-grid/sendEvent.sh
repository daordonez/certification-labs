location="eastus"
rgName="1-b3081f55-playground-sandbox"
subscriptionName="az204ViewerSub"
myTopicName="az204-eglab"

topicEndpoint=$(az eventgrid topic show --name $myTopicName -g $rgName --query "endpoint" --output tsv)
key=$(az eventgrid topic key list --name $myTopicName -g $rgName --query "key1" --output tsv)

event='[ {"id": "'"$RANDOM"'", "eventType": "recordInserted", "subject": "myapp/vehicles/motorcycles", "eventTime": "'`date +%Y-%m-%dT%H:%M:%S%z`'", "data":{ "make": "Contoso", "model": "Northwind"},"dataVersion": "1.0"} ]'

curl -X POST -H "aeg-sas-key: $key" -d "$event" $topicEndpoint