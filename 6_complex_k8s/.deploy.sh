docker build -t jcmunday/multi-client:latest -t jcmunday/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t jcmunday/multi-server:latest -t jcmunday/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t jcmunday/multi-worker:latest -t jcmunday/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push jcmunday/multi-client:latest
docker push jcmunday/multi-server:latest
docker push jcmunday/multi-worker:latest

docker push jcmunday/multi-client:$SHA
docker push jcmunday/multi-server:$SHA
docker push jcmunday/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/client-deployment client=jcmunday/multi-client:$SHA
kubectl set image deployments/server-deployment server=jcmunday/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=jcmunday/multi-worker:$SHA
