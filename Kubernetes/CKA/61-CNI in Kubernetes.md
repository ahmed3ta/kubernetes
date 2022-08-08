# CNI in Kubernetes

CNI as discussed defines the responsibilities of container run-time (docker)

![0c7624f2afdb0ffdf3e732774b893eba.png](../../_resources/0c7624f2afdb0ffdf3e732774b893eba.png)

so where is the CNI configured?

the CNI and network plugin are configured inside the kubelet service in the cluster

![a0384e949c85451a2830fa78ed3c1338.png](../../_resources/a0384e949c85451a2830fa78ed3c1338.png)

CNI Configurations can be found in the kubelet service that is running on the nodes, the cni/bin directory is where the network plugins are in, and the cni/net.d (configuration directory) is where the kubelet knows which plugin to be used.

in this case it's the bridge.conf, and if there is multiple files, it chooses with alphabetical order

![4ee1b5430693946bf98282bbb8440720.png](../../_resources/4ee1b5430693946bf98282bbb8440720.png)

