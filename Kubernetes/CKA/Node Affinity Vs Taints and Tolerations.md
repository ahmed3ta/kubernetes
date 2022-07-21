# Node Affinity Vs Taints and Tolerations

we can use Taints and Tolerations for making the Nodes not available for the not-desired-pods, but we can't guarantee that the pods will be placed on these nodes

on the other hand we can place an affinity on the pod to be placed on the desired node, but we can't guarantee that other pods will not be placed on this node.

so the solution for a specific pod to be placed on a specific node (non-manually) is to place a Node affinity with taints and tolerations