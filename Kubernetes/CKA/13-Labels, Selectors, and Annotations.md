# Labels, Selectors, and Annotations

`kubectl get pods --selector app=app1`

labeling are used for categorization or multi-categorization

kubernetes uses labels for object to select objects internally 

## Annotations

they are used for some integration purposes, not filtering

```YAML
metadata:
  name: pod1
  labels:
    name: pod-a
    app: app1
    function: front-end
  annotation:
    buildversion: 1.8.0.1
    phonenumber: +201020207919
spec:
```
