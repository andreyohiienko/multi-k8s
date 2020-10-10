# Build all our images, tag each one
docker build -t andreyohiienko/multi-client:latest -t andreyohiienko/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t andreyohiienko/multi-server:latest -t andreyohiienko/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t andreyohiienko/multi-worker:latest -t andreyohiienko/multi-worker:$SHA -f ./worker/Dockerfile ./worker
# Push each to docker hub
docker push andreyohiienko/multi-client:latest
docker push andreyohiienko/multi-server:latest
docker push andreyohiienko/multi-worker:latest

docker push andreyohiienko/multi-client:$SHA
docker push andreyohiienko/multi-server:$SHA
docker push andreyohiienko/multi-worker:$SHA
# Apply all configs in the 'k8s' folder
kubectl apply -f k8s
# Imperatively set latest images on each deployment
kubectl set image deployments/server-deployment server=andreyohiienko/multi-server:$SHA
kubectl set image deployments/client-deployment client=andreyohiienko/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=andreyohiienko/multi-worker:$SHA
