# Managing application logs

to get the live logs of the pod

`kubectl -f logs my-pod`

none live `kubectl logs my-pod`

however this command will not work if you have multiple containers in the pod

`kubectl -f logs my-pod container-1`
