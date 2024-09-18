myAPIName="az204-apim-${RANDOM}"
location="eastus"
rgName="1-b3081f55-playground-sandbox"
publisherEmail="hello@diegordonez.com"

echo "Creating Azure API management service - ${myAPIName}"
az apim create -n $myAPIName -l $location --publisher-email $publisherEmail -g $rgName --publisher-name az204-apimlab --sku-name Consumption