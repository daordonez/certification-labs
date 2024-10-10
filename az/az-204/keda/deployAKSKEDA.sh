resourceGroup="1-b9de7048-playground-sandbox"
region="westus"
randomSufix="${RANDOM}"
clusterName="az204-aks-${randomSufix}"
cluserDNSlabel="myaks-${randomSufix}"

#Creating the AKS cluster
echo "Creating AKS cluster: ${clusterName}"

az aks create -g $resourceGroup -n $clusterName --node-count 1 --generate-ssh-keys --enable-keda