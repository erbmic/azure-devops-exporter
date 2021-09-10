az aks get-credentials --resource-group test-monitoring --name monitoring

kubectl apply -f .\do-namespace.yaml -f .\prometheus-configmap.yaml -f .\prometheus-service.yaml -f .\prometheus-deployment.yaml -f .\grafana-configmap.yaml -f .\grafana-service.yaml -f .\grafana-deployment.yaml

kubectl apply -f .\do-namespace.yaml -f .\azure-configmap.yaml -f .\azure-exporter-service.yaml -f .\azure-secret.yaml -f .\azure-exporter-deployment.yaml -f .\prometheus-configmap.yaml -f .\prometheus-service.yaml -f .\prometheus-deployment.yaml -f .\grafana-configmap.yaml -f .\grafana-service.yaml -f .\grafana-deployment.yaml

kubectl port-forward -n do grafana-865fd5465f-8m2fv 3000



kubectl apply -f .\do-namespace.yaml -f .\grafana-ha-configmap.yaml -f .\grafana-ha-postgres.yaml -f .\grafana-ha-secret.yaml -f .\grafana-ha-service.yaml -f .\postgres-service.yaml -f .\grafana-ha-deployment.yaml -f .\azure-configmap.yaml -f .\azure-exporter-service.yaml -f .\azure-secret.yaml -f .\azure-exporter-deployment.yaml -f .\prometheus-configmap.yaml -f .\prometheus-service.yaml -f .\prometheus-deployment.yaml