# Role Based Access Control (RBAC)

## Role creation

```YAML
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: default
  name: pod-reader
rules:
- apiGroups: [""] # "" indicates the core API group
  resources: ["pods"]
  verbs: ["get", "watch", "list"]
- apiGroups: [""]
  resources: ["ConfigMaps"]
  verbs: ["get", "watch", "list"]
```

if it's blank then that means it's the core group api

and it's created normally `kubectl create -f role.yml`

## RoleBinding creation

to link a user to the role you create a role binding 

```YAML
apiVersion: rbac.authorization.k8s.io/v1

kind: RoleBinding
metadata:
  name: read-pods
  namespace: default
subjects:
- kind: User
  name: Atta # "name" is case sensitive
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role #this must be Role or ClusterRole
  name: pod-reader 
  apiGroup: rbac.authorization.k8s.io
```

created also using `kubectl create -f rolebinging.yml`

**Note**: roles and rolebinding fall under the scope of namespaces

## Some other imperative commands

`kubectl get roles `

`kubectl describe role pod-reader`

`kubectl get rolebindings`

`kubectl describe rolebinding name-reads`

## Check permissions

to check permissions for your self you can run the command of `kubectl auth can-i`

`kubectl auth can-i delete deploy`

`kubectl auth can-i list nodes -n dev-environment`

`kubectl auth can-i create pods --all-namespaces`

`kubectl auth can-i '*' '*'`

for other users:

`kubectl auth can-i list pods --as atta`

## Resource name

you can even grant more strict access to users by adding a resource name field to only access those resource fields

```YAML
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: default
  name: pod-reader
rules:
- apiGroups: [""] # "" indicates the core API group
  resources: ["pods"]
  verbs: ["get", "watch", "list"]
  resourceNames: ["pod01","pod02","pod04","pod10"]
- apiGroups: [""]
  resources: ["ConfigMaps"]
  verbs: ["get", "watch", "list"]
```
