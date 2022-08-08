# Taints and Tolerations 

they are simply for specifying what pod can be scheduled to be assigned to what node.

the taint can be placed (assigned) on a node, like a specific env, or a tier of the application.

then the toleration is the labels or function of the pod, which can be the env of this specific taint or not.

they does not tell the pod to go a certain node, it tells node to only accept pods with certain tolerations 

example:

Node1 has a dedicated resources for a particular use case, or an application to be placed on this node.

step1: to prevent all pods from being placed on the node, by placing a **taint** on the node, and by default none of the pods has a toleration for this taints.

step2: to place a toleration, and enable these pods to be placed on node1

## Taint

`kubectl taint nodes node-name key=value:taint-effect`

## what is the taint effect?

the taint-effect means what will happen to the pods that do not tolerate the taint, which has 3 kinds:

### 1- NoSchedule

means do not schedule the pods that don't tolerate

### 2- PreferNoSchedule

means that don't schedule if possible, it's not guaranteed  in high loads

### 3- NoExcute 

means do not schedule on the node, and existing pods on the node will be evicted if they do not tolerate the taints 

`kubectl taint nodes node01 app=app1:NoSchedule`

## Toleration

it's made in the spec section in the pod definition file

```YAML
spec:
  containers:
  - name: nginx
    image: nginx
  tolerations:
  - key: "app"
    operator: "Equal"
    value: "app1"
    effect: "NoSchedule"
```

Important Note:

a taint is set automatically on the master node to prevent it from accepting any pod rather than the system pods

`kubectl describe nodes minikube | grep Taint`

to remove the taint you add - to the end of the line/

`kubectl taint nodes node01 app=app1:NoSchedule-`
