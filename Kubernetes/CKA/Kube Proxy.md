# Kube Proxy 

a proxy is a process in every living node, its only job is look for new service and create the approperiate rules to the backend pods, a one way to do this is by an ip table rules.

an example using the ip table rule is to forward the trafiic for the ip of the service to the actual pod.

it's downloaded from the kubernetes release page.

`kubectl get pods -n kube-system` it's deployed as a daemonset (more than one pod)

so a single pod of kube-proxy is always deployed on the node in the cluster