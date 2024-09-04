import os, uuid
from azure.identity import DefaultAzureCredential
from azure.storage.blob import BlobServiceClient, BlobClient, ContainerClient

try:
    print("Azure blob storage Python quickstart sample")
except Exception as ex:
    print("Exception: ")
    print(ex)