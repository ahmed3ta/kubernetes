# Node Affinity

example1

```YAML
spec:
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExcution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: size
            operator: In
            values:
            - Large
            - Meduim
```

## Operator section can be:

`In/NotIn` which means key must be in/out of the values added

`Exist` which means that the meant label exist in the pod def file. 

## Node affinity types

`requiredDuringSchedulingIgnoredDuringExcution` : simply matches the labels

`preferredDuringSchedulingIgnoredDuringExcution` : simply matches the label in the best cases, but it's prefered so in high loads the labeling does not take place.

planned to be made:

`requiredDuringSchedulingRequiredDuringExcution` : it means when an admin removes the label from a pod, this will evict any pod without this label that are running on this node.