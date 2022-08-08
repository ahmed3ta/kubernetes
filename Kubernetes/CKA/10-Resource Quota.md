# Resource Quota

resource quota is used with the namespace to limit the resources used into this namespace

creating the resource quota with a yaml file.

```YAML
apiVersion: v1
kind: ResourceQuota
metadata:
  name: compute-quota
  namespace: dev
spec:
  hard:
    pods: "10"
    requests.cpu: "4"
    requrests.memory: 5Gi
    limits.cpu: "4"
    limits.memory: 10Gi
```
