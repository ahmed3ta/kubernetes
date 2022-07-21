# API Groups

![e2218d6ef5e1abcf9ad79d7bd6623a37.png](../../_resources/e2218d6ef5e1abcf9ad79d7bd6623a37.png)

focusing on the api and apis groups, the api group is a core group

![aa348512d0f6c80626149f8c8200eda8.png](../../_resources/aa348512d0f6c80626149f8c8200eda8.png)

the named group apis are more organized, they are devided info groups and each group has it's resouces and it's associated actions

![356a5aed343a15172a91a272e3e8f6d2.png](../../_resources/356a5aed343a15172a91a272e3e8f6d2.png)

to show this using kurl in the minikube environement:

```BASH
curl https://192.168.59.100:8443/api \
--key /home/atta/.minikube/profiles/minikube/client.key \
--cert /home/atta/.minikube/profiles/minikube/client.crt  \
--cacert /home/atta/.minikube/ca.crt
```

## Kubectl proxy

it's a utility that launches a proxy on port 8001 and uses credentials and certificates from your config file to access the cluster 
`curl 127.0.0.1:8001` and the kubectl proxy will forward it to the cluster with all the credentials needed

### Important Note:

kube proxy is not Kubectl proxy
kube proxy is used to enable connectivity between all the pods and services across different nodes in the cluster
kubectl proxy is an http service created by the kubectl utility to access the kube-apiserver