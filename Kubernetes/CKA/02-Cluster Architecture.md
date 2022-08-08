# Cluster Architecture

Kubernetes are like ships that cargo containers, and there is two types of ships, control ships and cargo (worker) ships

highly available key value store is called **ETCD (or etcd) Cluster** maintains the information about all the nodes in addition to tasks and containers that it holds, it's simply a database that stores the data in key value format.

kube-scheduler is the tool to distribute load on, finds the right node to work, based on resources and stuff.

**Node controller** handles controlling the nodes, **Replication Controller** is responsible for maintaining the desired number of nodes is running at all times in a replication group. all together is called the controller manager

they communicate with each other through the **kube-apiserver** it's the primary managing component, and it's responsible for orchestrating all operations within the cluster, it exposes the kubernetes API that is used by external uses to perform management operations on the cluster, as well as the various controllers to monitor the state of the cluster, and control the worker nodes to communicate with the server.

**container runtime engine** is the container application that holds the service needed (DNS, Application service, etc.), for that use it's needed that docker must be installed on all the nodes including the master node, like docker, Containerd, etc.

**the kubelet** is the captain of the node, it's the agent on the worker node that listens to instructions from the kube-apiserver, deploys or destroyes containers on the nodes, kube-apiserver periodicly fetches status reports from the kubelet

**kubeproxy** is the one responsible for communication between different components of the application, for example if the DB container are on a different nodes than the frontend nodes, kubeprocy is the one that enables communication between them.
