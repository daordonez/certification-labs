resourceGroupName="1-a5263cb4-playground-sandbox"
acrName="labaz204mypersonalacr"

#show acr image deployment
echo "ACR - ${acrName} image description"
az acr repository list -n $acrName -o table

#show imag tags
echo "ACR - ${acrName} tags description"
az acr repository show-tags -n $acrName --repository sample/hello-world -o table