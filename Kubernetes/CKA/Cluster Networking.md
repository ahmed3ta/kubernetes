# Cluster Networking

the cluster in Kubernetes consists of a master and multiple nodes should connect the nodes to the same network and every node has it's own IP and unique name, the master node should be reachable on port 6443 from all components, not just the nodes, it's the kubectl, and any other control plane component along side with the api users

- API 6443
- kubelet 10250
- kube-scheduler 10251
- kube-controller 10252
- external access services on worker nodes: 30000:32767
- etcd 2379
- etcd HA 2380

if you have multiple master nodes all these should be open as well, but you will need another port to be open 2380 for the etcd to communicate with each other

https://kubernetes.io/docs/reference/ports-and-protocols/