#Add Container apps extension for az-cli
az extension add --name containerapp --upgrade

#Namespaces
az provider register --namespace Microsoft.App
az provider register --namespace Microsoft.OperationalInsights