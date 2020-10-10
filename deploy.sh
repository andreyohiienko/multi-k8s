# Build all our images, tag each one
docker build -t andreyohiienko/multi-client -f ./client/Dockerfile ./client
docker build -t andreyohiienko/multi-server -f ./server/Dockerfile ./server
docker build -t andreyohiienko/multi-worker -f ./worker/Dockerfile ./worker
# Push each to docker hub
docker push andreyohiienko/multi-client
docker push andreyohiienko/multi-server
docker push andreyohiienko/multi-worker
# Apply all configs in the 'k8s' folder
kubectl apply -f k8s
# Imperatively set latest images on each deployment
kubectl set image deployments/server-deployment server=andreyohiienko/multi-server
