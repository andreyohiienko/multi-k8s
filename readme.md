# MULTI-K8S

## Issues
- [ ] Issue with travis decryption
- [x] Issue with Google Cloud files autoupdate
- [ ] Does not have minimum availability (postgres-deployment)

## Important takeaways
- Yaml file configure object
- **CluserIP** exposes a set of pods to other objects in the cluster
- **NodePort** exposes a set of pods to outside world (only good for dev purposes!!!)
- Traffic -> Ingress service -> Node -> Cluster IP Service -> Deployment -> Pod
- Pod -> ClusterIP -> Pod
- Persistent Volume Claim (PVC)
- Volume - some type of mechanism that allows a container to access a filesystem outside itself
- Volume (in Kubernetes) - An object that allows a container to store data at the pod level
- Persistent Volume locates outside of a Pod
- Ingress - exposes a set of services to the outside world
- [NGINX Ingress Controller](https://kubernetes.github.io/ingress-nginx/deploy/#provider-specific-steps)
- [Kubernetes dashboard setup](https://github.com/kubernetes/dashboard/tree/master/docs)
- [Helm](https://github.com/helm/helm)
- Tiller
- Role Based Access Control (RBAC)

## Commands
- kubectl apply -f \<folder> 
- kubectl get pvc
- kubectl create secret generic pgpassword --from-literal PGPASSWORD=12345asdf
  - secret - type of object
  - generic - type of secret (tls, docker-registry)
  - pgpassword - secret name
  - --from-literal - not from file
  - KEY=value
- docker system prune - clearing the build cache

### Running Travis CLI in a container
- ```docker run -it -v ${pwd}:/app ruby:2.3 sh``` - Travis CLI requires ruby
- ```gem install travis``` - install ruby in container
- travis login --org
- copy json file into the 'volumed' directory so we can use it in the container
- travis encrypt-file service-account.json -r andreyohiienko/multi-k8s --org
- DELETE ORIGINAL service-account.json

### Helm v2 Update
- curl -LO https://git.io/get_helm.sh
- chmod 700 get_helm.sh
- ./get_helm.sh 

### Assigning Tiller a service account
- ```kubectl create serviceaccount --namespace kube-system tiller``` - create a new service account called tiller in the kube-system namespace
- ```kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller``` - create a new clusterrolebinding with the role 'cluster-admin' and assign it to service account 'tiller'
- helm init --service-account tiller --upgrade

### Ingress-Nginx with Helm
- helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx/
- helm install --name ingress-nginx ingress-nginx/ingress-nginx --set rbac.create=true

## Cert Manager Installation
- kubectl apply --validate=false -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.11/deploy/manifests/00-crds.yaml
- kubectl create namespace cert-manager
- helm repo add jetstack https://charts.jetstack.io
- helm repo add jetstack https://charts.jetstack.io
- helm repo update
- Helm v2:
  - helm install \
    --name cert-manager \
    --namespace cert-manager \
    --version v0.11.0 \
    jetstack/cert-manager
- Helm v3:
  - helm install \
    cert-manager \
    --namespace cert-manager \
    --version v0.11.0 \
    jetstack/cert-manager