# Azure container Apps for the CLI

In order to run Azure Container Apps it's mandatory to install the extensions and name spaces bellow:

### Azure Container Apps extension
`
az extension add --name containerapp --upgrade
`

### Azure `Microsoft.App` provider
`az provider register --namespace Microsoft.App`

### Azure `Microsoft.OperationalInsights` provider
`az provider register --namespace Microsoft.OperationalInsights`

---
# Verify AZ providers & namespaces

You can verify the registration status of the providers and namespaces withe the command bellow:
`az provider show --namespace <Name.Space> --query "registrationState" -o tsv`