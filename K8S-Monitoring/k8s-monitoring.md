# Kubernetes Monitoring and Grafrana 

Kubernetes monitoring involves collecting, processing, and analyzing metrics and logs from various components within your cluster.

Prometheus is open-source monitoring system, ideal for Kubernetes. It scrapes metrics from various sources, stores them in a time-series database, and provides a query language (PromQL) for analysis.

Grafana is an open-source platform for visualizing and analyzing metrics. It connects to various data sources (like Prometheus) and allows you to create:

* **Dashboards:** Collections of panels displaying metrics in various formats (graphs, tables, gauges).
* **Panels:** Individual visualizations representing specific metrics.
* **Alerts:** Notifications triggered when metrics meet certain conditions.

<kbd>![image](/img/prometheus%20_vs_grafrana.png)</kbd>


## Metrics

* **Resource Metrics:**  CPU usage, memory usage, network traffic, disk I/O. These metrics provide insights into the resource consumption of your pods and nodes.
* **Application Metrics:** Request latency, error rates, throughput. These metrics are specific to your applications and provide insights into their performance and health.
* **Custom Metrics:**  Metrics that are not standard Kubernetes metrics but are relevant to your applications or infrastructure.

## Monitoring Tools

* **Metrics Server:**  A built-in component that collects resource usage data for pods and nodes.
* **Prometheus:** A popular open-source monitoring system that collects metrics from various sources and provides alerting capabilities  (or time series database , scrap data, data source, query server ).
* **Grafana:**  A visualization and dashboarding tool that can be used to display metrics from Prometheus and other sources.
* **cAdvisor:**  A container monitoring tool that collects resource usage and performance characteristics of containers.

## Installing Prometheus and Grafana

To set up monitoring for your Kubernetes cluster, you can install Prometheus and Grafana. Follow these steps:

### Installing Prometheus

1. **Add the Prometheus Helm repository:**
    ```sh
    helm repo add prometheus-community https://
    prometheus-community.github.io/helm-charts
    helm repo update
    ```

2. **Install Prometheus and grafana using Helm:**
    ```sh
    helm install prometheus prometheus-community/prometheus
    ```
    This command installs the Prometheus stack using Helm from the prometheus-community repository. It sets up the Prometheus and Grafana services in the 'monitoring' namespace with specific configurations:

    Prometheus service is exposed on NodePort 30000
    Grafana service is exposed on NodePort 31000
    Both Prometheus and Grafana services are of type NodePort
    
    ```sh
    helm install prometheus-stack prometheus-community/kube-prometheus-stack --namespace monitoring 
    --set prometheus.service.nodePort=30000 
    --set frafana.service.nodePort=31000 
    --set grafana.service.type=NodePort 
    --set prometheus.service.type=NodePort 
    ```

3. **Verify the installation pods , svc:**
    ```sh
    kubectl get pods -n monitoring
    
    kubectl get svc -n monitoring
    ```
4. **Access Promtheus:**
    ```sh
    kubectl port-forward svc/prometheus-stack-kube-prom-prometheus 9090:9090 -n monitoring

    or 
    // The `&` at the end of the command runs the port-forwarding process in the background.

    kubectl port-forward svc/prometheus-stack-kube-prom-prometheus 9090:9090 -n monitoring &

    ```

4. **Access Grafana:**
    ```sh
    kubectl port-forward svc/prometheus-stack-grafana 3000:80 -n monitoring &
    ```

    Open your browser and navigate to `http://localhost:3000`. The default login is `admin` for user name.

    And get password , this password show base64 encoded 
    ```sh
    kubectl get secret prometheus-stack-grafana -n monitoring -o jsonpath="{.data.admin-password}"
    ```
    base64 decode , 
  
    ```sh 
    kubectl get secret prometheus-stack-grafana -n monitoring -o jsonpath="{.data.admin-password}" | base64 --decode
    ```

    terminated all port-forward 

    ```sh
    pkill -f 'kubectl port-forward'
    ```
    Arternatively , you can 
    ```sh 
    sudo lsof -i :3000
    or
    ps aux | grep 'kubectl port-forward'

    kill -9 <PID>
    ```
By following these steps, you will have Prometheus and Grafana installed in your Kubernetes cluster, enabling you to monitor and visualize your metrics effectively.
