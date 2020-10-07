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

## Commands
- kubectl apply -f \<folder> 