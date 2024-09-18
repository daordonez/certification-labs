location="eastus"
rgName="1-b3081f55-playground-sandbox"
#Event grid params
myTopicName="az204-eglab"

az eventgrid topic create -n $myTopicName -l $location -g $rgName