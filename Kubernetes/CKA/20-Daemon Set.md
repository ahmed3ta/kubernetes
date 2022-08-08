# Daemon Set

Daemon set creates a pod on every node and when this node is terminated the pod with it is also terminated. it ensures that one copy of the pod is always present on every node.

it's mainly used for monitoring/logging like agents on all the nodes.

one of it's uses is the kube-proxy, other use cases is networking like weave-net

## How does it work?

the Daemon set used to work with the nodeName proberty for each pod to be assigned to each node, until Kubernetes v1.12.

later then the Daemon set used NodeAffinity with the default scheduler to assign the pods to nodes

### Note that the kube-scheduler has no effect on this pods.
