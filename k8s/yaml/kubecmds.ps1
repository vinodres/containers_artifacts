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
az aks get-credentials --resource-group vinod-rg --name vinod-chlng-02

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

az aks create \ 
    --resource-group $RESOURCE_GROUP \ 
    --name $CLUSTER_NAME \ 
    --attach-acr $ACR \ 
    --node-count 3 \ 
    --network-plugin azure \ 
    --vnet-subnet-id $CLUSTER_SUBNET_ID \ 
    --service-cidr 10.0.0.0/24 \ 
    --dns-service-ip 10.0.0.10 \ 
    --docker-bridge-address 172.17.0.1/16 \ 
    --enable-aad \ 
    --aad-admin-group-object-ids $GROUP_OBJECT_ID \ 
    --generate-ssh-keys 
