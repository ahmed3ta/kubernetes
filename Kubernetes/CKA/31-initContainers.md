# initContainers

these type of containers depneds on the need of other containers in the pod on some prequisite tasks or info, For example a process that pulls a code or binary from a repository that will be used by the main web application. That is a task that will be run only one time when the pod is first created. Or a process that waits for an external service or database to be up before the actual application starts. That's where **initContainers** comes in.

When a POD is first created the initContainer is run, and the process in the initContainer must run to a **completion** before the real container hosting the application starts. 

You can configure multiple such initContainers as well, like how we did for multi-pod containers. In that case each init container is run **one at a time in sequential order**. 

If any of the initContainers fail to complete, Kubernetes restarts the Pod repeatedly until the Init Container succeeds.

## how to define the error in a Container:

kubectl logs pod1 -c init-container1
