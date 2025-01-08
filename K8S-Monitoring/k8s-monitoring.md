# Kubernetes Monitoring: Key Terms and Concepts

Monitoring your Kubernetes cluster and applications is crucial for ensuring their health, performance, and stability. Here are some key terms and concepts related to Kubernetes monitoring:

## Metrics

* **Resource Metrics:**  CPU usage, memory usage, network traffic, disk I/O. These metrics provide insights into the resource consumption of your pods and nodes.
* **Application Metrics:** Request latency, error rates, throughput. These metrics are specific to your applications and provide insights into their performance and health.
* **Custom Metrics:**  Metrics that are not standard Kubernetes metrics but are relevant to your applications or infrastructure.

## Monitoring Tools

* **Metrics Server:**  A built-in component that collects resource usage data for pods and nodes.
* **Prometheus:** A popular open-source monitoring system that collects metrics from various sources and provides alerting capabilities  (or time series database , scrap data, data source, query server ).
* **Grafana:**  A `visualization and dashboarding tool` that can be used to display metrics from Prometheus and other sources.
* **cAdvisor:**  A container monitoring tool that collects resource usage and performance characteristics of containers.

## Monitoring Concepts

* **Instrumentation:** The process of adding code to your applications to expose metrics.
* **Scraping:**  The process of collecting metrics from various sources by a monitoring system like Prometheus.
* **Alerting:**  Defining rules to trigger alerts when specific metrics exceed thresholds or meet certain conditions.
* **Dashboards:** Visual representations of your metrics that provide insights into the health and performance of your applications and cluster.

## Key Metrics to Monitor

* **CPU Usage:**  Track the CPU utilization of your pods and nodes to identify potential bottlenecks.
* **Memory Usage:**  Monitor memory consumption to ensure your applications have enough resources and avoid memory leaks.
* **Request Latency:** Measure the time it takes for your applications to respond to requests.
* **Error Rates:**  Track the number of errors occurring in your applications to identify potential issues.
* **Throughput:**  Measure the number of requests your applications can handle per second.
* **Pod Restarts:** Monitor the number of pod restarts to identify instability or issues with your applications.
* **Node Status:**  Track the health and availability of your nodes.

## Monitoring Best Practices

* **Establish Baselines:** Understand the normal behavior of your applications and cluster to identify deviations.
* **Set Alerts:** Define alerts for critical metrics to be notified of potential issues.
* **Use Dashboards:** Create dashboards to visualize your metrics and gain insights into your applications and cluster.
* **Monitor Logs:**  Correlate metrics with logs to troubleshoot issues effectively.
* **Implement Centralized Logging:** Aggregate logs from your applications and cluster for easier analysis.

By understanding these Kubernetes monitoring terms and concepts, you can effectively monitor your applications and cluster, ensuring their health, performance, and stability.
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

    or 

    // This command installs the Prometheus stack using Helm from the prometheus-community repository.
    // It sets up the Prometheus and Grafana services in the 'monitoring' namespace with specific configurations:
    // - Prometheus service is exposed on NodePort 30000
    // - Grafana service is exposed on NodePort 31000
    // - Both Prometheus and Grafana services are of type NodePort

    helm install prometheus-stack prometheus-community/kube-prometheus-stack --namespace monitoring --set prometheus.service.nodePort=30000 --set frafana.service.nodePort=31000 --set grafana.service.type=NodePort --set prometheus.service.type=NodePort 
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
