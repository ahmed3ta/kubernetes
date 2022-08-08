# Monitoring cluster component 

Metrics server is the slip version of heapster

you can have one metrics server per cluster, the collects retrieves metrics from each kubernetes nodes aggregates them and stores them in memory (in-memory solution) as a result you can't see historic performance data.

the kubelet has a component called cAdvisor (container advisor) who collects the performance metrics from the containers and pass them to the kubelet, the kubelet then collects them and exposing them through the kubelet api to make the metrics available for the metrics server.

for minikube: `minikube addons enable metrics-server`

for anyother:

`git clone https://github.com/kubernetes-sigs/metrics-server `

`kubectl create –f deploy/1.8+/`
