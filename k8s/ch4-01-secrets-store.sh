#!/bin/bash

export RESOURCE_GROUP=teamResources
export CLUSTER_NAME=test-aks-chlng-03

export RESOURCE_AKS_GROUP=cha-03-cluster

export KEYVAULT_NAME=sqlinfo

export SQL=$(az sql server list -g $RESOURCE_GROUP --query "[0].name" -o tsv)
export SQL_SERVER=$(az sql server show -g $RESOURCE_GROUP -n $SQL --query fullyQualifiedDomainName -o tsv)
export SQL_USER=$(az sql server show -g $RESOURCE_GROUP -n $SQL --query administratorLogin -o tsv)
export SQL_DBNAME=mydrivingDB

# Enable Secrets Store CSI Driver Azure Provider add-on
az aks enable-addons -g $RESOURCE_AKS_GROUP -n $CLUSTER_NAME --addons azure-keyvault-secrets-provider
    
# Due to the CLI VERSION, this command line is run in the cloud shell
az aks enable-addons -g teamResources -n aksCNI --addons azure-keyvault-secrets-provider

export SECRETS_PROVIDER_IDENTITY=$(az aks show -g $RESOURCE_AKS_GROUP -n $CLUSTER_NAME --query "addonProfiles.azureKeyvaultSecretsProvider.identity.clientId" -o tsv)

# Create a keyvault
az keyvault create -n $KEYVAULT_NAME -g $RESOURCE_AKS_GROUP

# Add the SQL connection info to the keyvault
# Secrets can't have underscores in their names
az keyvault secret set --vault-name $KEYVAULT_NAME -n SQLSERVER --value "$SQL_SERVER"
az keyvault secret set --vault-name $KEYVAULT_NAME -n SQLDBNAME --value "$SQL_DBNAME"
az keyvault secret set --vault-name $KEYVAULT_NAME -n SQLUSER --value "$SQL_USER"
az keyvault secret set --vault-name $KEYVAULT_NAME -n SQLPASSWORD --value "$SQL_PASSWORD"

# Allow Secrets Provider id to get secrets
az keyvault set-policy -n $KEYVAULT_NAME --secret-permissions get --spn $SECRETS_PROVIDER_IDENTITY
