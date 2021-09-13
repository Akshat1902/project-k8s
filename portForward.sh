kubectl port-forward --address 0.0.0.0 service/vote-app-service 8085:80 2>&1 >/dev/null &
kubectl port-forward --address 0.0.0.0 service/result-app-service 8086:80 2>&1 >/dev/null &