#to get more details on Kind type
kubectl explain pod
kubectl get rs
kubectl get pods --show-labels
kubectl rollout history deployment web
kubecl rollout undo deplyments web-v1 --to-revision=1 #to go back to a particular version
kubecl rollout undo deplyments web-v1 # to go back to previous version
kubectl rollout --status

#Login o Azure
az login
az account show
az account set --subscription f4d4ae10-2845-463b-9582-7ae02fffc53c

#To fetch cluster configuration for authenticaion
az aks get-credentials --resource-group cha-03-cluster --name test-aks-chlng-03

team03-api
89518f25-9cf0-449c-81f5-907c2cba8063

team03-web
3d3a73b7-0ff5-45fe-8108-02408c910787

$SECRETS_PROVIDER_IDENTITY
3b922360-6604-469e-8b51-7b532c1387d9

#assign role to api dev user 
az role assignment create --assignee $WEB_GROUP_ID --role "Azure Kubernetes Service Cluster User Role" --scope $CLUSTER_ID

INFO: 2023/04/28 18:15:01 main.go:36: Trips Service Server started on port 80
INFO: 2023/04/28 18:16:20 logger.go:59: getAllTrips - Query Failed to Execute.
DEBUG: 2023/04/28 18:16:20 logger.go:60: lookup sqladminxZq2360.database.windows.net on 10.0.0.10:53: no such host      


az aks show -g cha-03-cluster -n test-aks-chlng-03 -o tsv --query addonProfiles.httpApplicationRouting.config.HTTPApplicationRoutingZoneName


helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx 

helm repo update 

helm install ingress-nginx ingress-nginx/ingress-nginx --create-namespace --namespace ingress -f nginx-helm-values.yaml

#With RBAC use brackglass Account that has Kubernetes admin role access in Azure
az aks get-credentials --resource-group vinod-rg --name vinod-chlng-02 --admin

# to get kubeconfig with AAD RBAC user should have "Kubernetes User ROle" Assigned in Azure
# Ro get access to cluster, user should be added to the admin groups and / or added as a role with Cluster Role Binding on the K8s cluster


# List all deployments in all namespaces
kubectl get deployments --all-namespaces=true

# List all deployments in a specific namespace
# Format :kubectl get deployments --namespace <namespace-name>
kubectl get deployments --namespace kube-system

# List details about a specific deployment
# Format :kubectl describe deployment <deployment-name> --namespace <namespace-name>
kubectl describe deployment my-dep --namespace kube-system

# List pods using a specific label
# Format :kubectl get pods -l <label-key>=<label-value> --all-namespaces=true
kubectl get pods -l app=nginx --all-namespaces=true

# Get logs for all pods with a specific label
# Format :kubectl logs -l <label-key>=<label-value>
kubectl logs -l app=nginx --namespace kube-system

touch deployment.yaml

kubectl apply -f ./deployment.yaml

kubectl get deploy contoso-website

touch service.yaml
kubectl apply -f ./service.yaml

touch ingress.yaml

kubectl scale --replicas=3 -f ./deployment.yaml 

kubectl delete --all pods --namespace=default

#Manual Scaling out
kubectl scale deploy name --replicas=5
# Scaling in
kubectl scale deployment name --replicas=3
#Horizonal Pod Autoscaler
kubectl autoscale deployment name --max=10 --min=3 --cpu-percent=50

az aks nodepool add --resource-group Contoso-RG --cluster-name aks-disney --name gpunodepool --node-count 1 --node-taints sku=gpu:NoSchedule --no-wait

az aks create --resource-group test-aks-chlng-03-rg --name test-aks-chlng-03 --attach-acr registryxzq2360 --node-count 3 --network-plugin azure --vnet-subnet-id "/subscriptions/4e0497c8-1ed4-4b48-bb4b-5692e3d3c0d7/resourceGroups/teamResources/providers/Microsoft.Network/virtualNetworks/vnet/subnets/aks-03-subnet" --service-cidr 10.0.0.0/24 --dns-service-ip 10.0.0.10 --docker-bridge-address 172.17.0.1/16 --enable-aad --aad-admin-group-object-ids 3887530c-9700-4cfe-8fad-5f18e6637558 --generate-ssh-keys 

az aks create --resource-group test-aks-chlng-03-rg --name test-aks-chlng-03 --attach-acr registryxzq2360 --node-count 3 --network-plugin azure --vnet-subnet-id aks-03-subnet --service-cidr 10.0.0.0/24 --dns-service-ip 10.0.0.10 --docker-bridge-address 172.17.0.1/16 --enable-aad --aad-admin-group-object-ids 3887530c-9700-4cfe-8fad-5f18e6637558 --generate-ssh-keys 

27d57a00-d2d5-4639-a07c-d861a74fd5ac

    az network vnet subnet list -g teamResources --vnet-name vnet -o table

    SUBNET=$(az network vnet subnet list --resource-group teamResources --vnet-name vnet --query "[?name=='aks-03-subnet'].id" --output tsv)

    /subscriptions/4e0497c8-1ed4-4b48-bb4b-5692e3d3c0d7/resourceGroups/teamResources/providers/Microsoft.Network/virtualNetworks/vnet/subnets/aks-03-subnet

    az network vnet subnet list \ --resource-group teamResources \ --vnet-name vnet \ --query "[0].id" --output tsv