# OS Upgrades

there are multiple scenarios for a node to be offline, the scenarios has two types:

### 1- if the node is down

in this case the master node waits for 5 mins and then it assumes that the node is terminated, and then if the pods inside a replicaset, they are transferred onto another node.

Time it waits for the node to come up is known as the eviction-timeout, and it's set on the controller manager and default value is 5 minutes:

`kube-controller-manager --pod-eviction-timeout=5m0s`

this is dangerous when there is a specific pod that runs on this node and does not have a replicaset, which means it can't be replaced on other nodes, so if a node which have a pod that does not belong to a replicaset is on a node and it went down for a long time, you have to be careful, what can be done if there is an upgrade is to drain the node

### 2- If you need to make an Upgrade or gracefully take down the node

to release the pods from a node you can drain the node:

`kubectl drain node-1`

this way the node is unscheduled, and no pods can be put on it, when it comes back online you need to run:

`kubectl uncordon node-1` this way you make it scheduled again.

**Important note:** the pods on the other nodes which were moved in the drain, don't necessarily have to go back to node-1 if the pods where deleted or any other nodes were down, then they are scheduled 

`kubectl cordon node-1`

this command simply makes the node unscheduled meaning that there is no new pod to be scheduled on this node, but not necessarily terminate any of the existing pods