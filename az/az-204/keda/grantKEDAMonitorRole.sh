resourceGroup="1-b9de7048-playground-sandbox"
region="westus"
sbNameSpaceName="az204-myNetCoreSB"
queueName="orders"
roleName="order-monitor"

echo "Creating KEDA authorization rule: ${roleName}"
roleDescription=$(az servicebus queue authorization-rule create -g $resourceGroup --namespace-name $sbNameSpaceName --queue $queueName --name $roleName --rights Manage Send Listen)

echo "Showing KEDA role description:"
echo $roleDescription

#Getting connection string
baseConnectionString=$(az servicebus queue authorization-rule keys list -g $resourceGroup --namespace-name $sbNameSpaceName --queue-name $queueName --name $roleName)
kedaConnectionString=$(echo $baseConnectionString | jq -r '.primaryConnectionString')
b64KedaCS=$(echo -n $kedaConnectionString | base64)

echo "Use the connection string bellow to modify your KEDA deployment:"
echo $b64KedaCS