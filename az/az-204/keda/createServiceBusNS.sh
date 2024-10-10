resourceGroup="1-b9de7048-playground-sandbox"
region="westus"
sbNameSpaceName="az204-myNetCoreSB"
queueName="orders"
authRuleName="order-consumer"

echo "Creating AZ Service Bus namespace: ${sbNameSpaceName}"
az servicebus namespace create -n $sbNameSpaceName -g $resourceGroup --sku basic

echo "Creating queue: ${queueName}"
az servicebus queue create --namespace-name $sbNameSpaceName -n $queueName -g $resourceGroup

echo "Creating new authorization rule over already created queue: ${queueName}"
az servicebus queue authorization-rule create -g $resourceGroup --namespace-name $sbNameSpaceName --queue-name $queueName --name $authRuleName --rights Listen

echo "Showing queue authorization rule description:"
orderConsumerRole=$(az servicebus queue authorization-rule keys list -g $resourceGroup --namespace-name $sbNameSpaceName --queue-name $queueName --name $authRuleName)

echo $orderConsumerRole

#connection string
initRole=$(echo $orderConsumerRole | jq -r '.primaryConnectionString')
b64StringInitRole=$(echo -n "${initRole}" | base64)

echo "Use the connection string bellow to modify your keda deployment:"
echo ${b64StringInitRole}