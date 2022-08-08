# Kubelet 

it's like the captain on the ship. it's the sole point of contact with the kube-apiserver

it registers the node into the kubernetes cluster, when it recieves instructions to load a container or a pod, it requests the container rumtime engine (docker, containerd) to pull the image and run an instance.

then it continues to monitor the state of the pod and reports the status to the kube-apiserver.

* * *

how to install the kubelet?

unlike other components of the kubernetes it does not get automatically installed, you must always install it. download the installer from the kubernetes release page and extract it, and then run it as a service.

ps -aux | grep kubelet.
