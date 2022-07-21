# Security contexts

Security Contexts are the set of options defined to secure the container such as defining a user ID and Capabilities, in a docker container, the security contexts are defined as follows:

`docker run --user=1001 ubuntu sleep 3600`

`docker run -cap-add MAC_ADMIN ubuntu`

this can be also defined on a pod, even can be defined on a container in a pod.

when defining security contexts on a pod, these contexts are passed to all containers in the pod, and when you define of a pod and the container inside it, the security contexts inside the containers overwrite the ones from the pod.

an Example for Pod security contexts:

```YAML
apiVersion: v1
kind: Pod
metadata:
  name: ubuntu
spec:
 securityContext:
   runAsUser: 1000
 containers:
 - name: ubuntu
   image: ubuntu
```

to run on a container leve:

```YAML
apiVersion: v1
kind: Pod
metadata:
  name: ubuntu
spec:
 containers:
 - name: ubuntu
   image: ubuntu
   securityContext:
    runAsUser: 1000
```