# Kube-APIServer 

when running the kubectl command the Kube-apiserver authenticates the request and validates it. after that it gets the data from teh ETCD cluster and return the request back with the needed data.

\*\*Important node: \*\*you don't need to involve the CLI in that, instead you can get the data with a POST Requets (involving the APIs Directly).

1- when a pod is created by a POST Request, the API Server then creates the pod without a node to assign.

2- The etcd server is updated with the pod, and then the API server send the data to the kube-scheduler

3- The Kube-scheduler assign the pod to a proper node and then go back to the api server with the pod/node information

4- Further more the api server updates the etcd with the pod/node data. The API Server then passes this info to the kubelet in the appropriate worker node,

5- The kubelet then creates the node and instructs the runtime container to deploy the application image once done the kubelet updates the data and send it to the apiserver, and the apiserver updates the data in the etcd cluster.

a similar process is operated every single time a pod is created, or any other thing. (the Kube-APIServer is at the center of all tasks that needs to be performed in the kubernetes cluster)

to summarize the Kube-API Server is responsible for authenticating and validating the requests, retrieving and updating data in the ETCD Cluster, infact it's the only component that can update the data in the etcd

* * *

if you are setting up the kube-apiserver by binaries, it can be found on the kubernetes release page. that can be skipped if you are installing using the kubeadm tool.

the binaries are downloaded and configured on the vm that will work as the masternode

in the kube-apiserver.service

`--etcd-servers=https:\\127.0.0.1:2379` this is how the kube-apiserver connects to the etcd server

if you deployed the kubeadm you will find that the kube-apiserver is a pod `kubectl get pod -n kube-system`

you will find the definition file of the pod in /`etc/kubernetes/manifests/kube-apiserver.yaml` and you can inspect the options by viewing kube-apiserver.service located at `/etc/systemd/system/kube-apiserver.se`

also you can see the process and the process option by running `ps -aux | grep kube-apiserver`