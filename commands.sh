kubectl exec -it java-api-pod -- sh # Enter into the pod terminal
kubectl port-forward pod/java-api-pod 8081:8081 # Open a port between you host and the cluster to access the pod
kubectl scale deployment java-api-deployment --replicas=5 # Scale for more replicas
watch -n1 kubectl top pod -l app=java-api-limited # Get how much resources the pods are using
kubectl get svc -n ingress-nginx ingress-nginx-controller # Get ingress controller of nginx