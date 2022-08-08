# TLS in Kubernetes

it's important that all the connections between all Kubernetes component be secure by TLS

<img src="../../_resources/d830d90204b6980fcf50d232ef3453d7.png" alt="d830d90204b6980fcf50d232ef3453d7.png" width="962" height="492">

that includes connections between an admin and API Server, API Server and all Components, and Masternode and all the other nodes.

* * *

## identifying the server components ( components that other clients connect to)

<img src="../../_resources/2ff4cbfa17164e46994319e83f7e6300.png" alt="2ff4cbfa17164e46994319e83f7e6300.png" width="534" height="467">

for Clients Certificates:

### 1- Kube-Apiserver clients:

<img src="../../_resources/d1dced09bb35be83e464401fa8a902b9.png" alt="d1dced09bb35be83e464401fa8a902b9.png" width="582" height="436">

### 2- ETCD Server Clients

and that is only the Kube-Apiserver, which is the only one talking to the ETCD Server

you can either provide the kube-Apiserver public key or create a new pair specific for the etcd server

![d47a7781f9a7ad8086be98598dbb189b.png](../../_resources/d47a7781f9a7ad8086be98598dbb189b.png)

### 3- kubelet Server Clients

it's Exactly the same as ETCD, with the kube-apiserver

* * *

**Important note:**

Kubernetes requires you to have at least one CA in the Cluster and the certificates for that CA is ca.crt and ca..key

* * *

![93f82435e2fc3fd1193ee27cddee33e8.png](../../_resources/93f82435e2fc3fd1193ee27cddee33e8.png)
