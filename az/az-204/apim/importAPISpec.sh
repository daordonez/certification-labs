location="eastus"
rgName="1-b3081f55-playground-sandbox"
publisherEmail="hello@diegordonez.com"

#API params
myServiceAPIName="API-${RANDOM}-conference"
APIGWName="az204-apim-24836"
APIPath='conference'
specificationFormat="OpenAPI"
specURL="https://conferenceapi.azurewebsites.net?format=json"

echo "Importing API into API GW - ${myServiceAPIName}"
az apim api import --path $APIPath -g $rgName -n $APIGWName --api-id $myServiceAPIName --specification-format $specificationFormat --specification-url $specURL --subscription-required false