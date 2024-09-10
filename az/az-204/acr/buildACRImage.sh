acrName="labaz204mypersonalacr"

echo "Building image from Dockerfile"
# param '--image' defines the given name of the image that has just been created, in this case will be 'sample/hello-world'.
# ':' represents the given tag of the image itself, which is intended to identify different versions about the same image. v1 in this case.
az acr build --image sample/hello-world:v1 --registry $acrName --file Dockerfile .