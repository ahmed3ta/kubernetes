# kubernetes scheduler 

scheduler only schedule which pod on which node it DOES NOT put the pods on the nodes, the kublet is the one who creates the pods on the Node, scheduler decides which pod where.

## why do you need a scheduler?

when the pods are too much for a lot of nodes, you need to know which pod end on which node you want to make sure that the node has sufficient capacity to accommodate those containers and pods.

2 phase

1- filer out the nodes that do not fit the requirements profile

2- ranks the node based on priority function that rates the nodes on a scale from  0 to 10

many ranking to look at like (Resource requirements and Limits, Taints and Tolerations, Node Selectors/Affinity)

Example:

a pod with requirements of CPU=10

1- it filters out the nodes that has less than 10 cpu

2- calculates the remaining cpu after placing the pod on them and set priority rankings

* * *

as always down load the scheduler form the kubernetes release page, extract it and run it as a service

kubeadm has a pod of kube-scheduler, manifest file in `/etc/kubernetes/manifests/kube-scheduler.yaml`

you can also view the options and process

`from /etc/systemd/system/kube-scheduler.se` and `ps -aux | grep kube-scheduler`
