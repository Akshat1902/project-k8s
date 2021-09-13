kubectl port-forward --address 0.0.0.0 service/py-vote-service 8085:80 2>&1 >/dev/null &
kubectl port-forward --address 0.0.0.0 service/node-result-service 8086:80 2>&1 >/dev/null &