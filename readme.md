# MULTI-K8S

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

## Commands
- kubectl apply -f \<folder> 
- kubectl get pvc
- kubectl create secret generic pgpassword --from-literal PGPASSWORD=12345asdf
  - secret - type of object
  - generic - type of secret (tls, docker-registry)
  - pgpassword - secret name
  - --from-literal - not from file
  - KEY=value

### Running Travis CLI in a container
- docker run -it -v ${pwd}:/app ruby:2.3 sh - Travis CLI requires ruby
- gem install travis - install ruby in container
- travis login
- copy json file into the 'volumed' directory so we can use it in the container
- travis encrypt-file service-account.json -r andreyohiienko/multi-k8s
- DELETE ORIGINAL service-account.json