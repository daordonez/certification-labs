#This script is intended to create an Azure Cosmos DB via az-cli on a basis of the given variables
#Vars
location="westus"
rgName="1-1e5eec39-playground-sandbox"
cosmosDBResourceName="az204labcosmosdb"

az login

echo "Deploying AZ Cosmos DB engine"
az cosmosdb create -n $cosmosDBResourceName -g $rgName

echo "Fetching Cosmos DB connection params"
documentEndpoint=$(az cosmosdb show -n $cosmosDBResourceName -g $rgName --query "documentEndpoint" -o tsv)
pk=$(az cosmosdb keys list -n $cosmosDBResourceName -g $rgName -o tsv)

#Out put params
echo "documentEndpoint: ${documentEndpoint}"
echo "cosmosDBPrivateKey: ${pk}"

