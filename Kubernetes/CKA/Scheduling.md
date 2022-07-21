# Manual Scheduling

## how does scheduling works?

scheduling is done by a default value in the live defenition file called nodeName, this value is set to null by default

```YAML
spec:
    containers:
    - name: nginx
      image: nginx
      ports:
        - containerPort: 80
    nodeName:
```

after making the pod for example, the scheduler has to answer two questions:

1- **what to schedule?** to determine the right pod, after that it uses **T****he scheduling algorithms** to answer

2- **which node to schedule?**, based on the metrics after that the pod is set to a node by creating **a binding object.**

* * *

when there is a scheduler, the pod enters a pending state, then you can manually assign the node to this pod.

without a schedule we can create a binding object to set the targeted node

```YAML
apiVersion: v1
kind: Binding
metadata:
    name: nginx
target:
    apiVersion: v1
    kind: Node
    name: node02
```

what does the binding do?

it mimic the binding of the pod by sending a post request to the api binding of the pod with the new binding option

## notes:

\- when the pod is in pending state, check the cheduler exists or not by `kubectl get pod -n kube-system | grep schedule`

\- you can move pods from a system to another by by 2 steps: edit the manifest nodeName: &lt;the node&gt;, and then run `kubectl replace -f --force new-manifest.yml`

\- when the replace happens it terminates the pod, the pod is basically a process which means it sends a kill signal.