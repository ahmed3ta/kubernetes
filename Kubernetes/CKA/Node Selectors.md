# Node Selectors

it's simply like the selectors on any other object, but it's more important as the uses is limitless.

for example if a node has more resources than the other nodes, and you need to assign the large pods in it, you simply put the nodeSelector proberty.

```YAML
spec:
  containers:
  - name: data-processor
    image: data-processor
  nodeSelector
    size: large #this label must be configured on the node first.
```

`kubectl label node node01 size=large`

## Limitations

you can't make a more complex selection, like large or medium, or like not small.

node affinity and anti-affinity serves this porpuse