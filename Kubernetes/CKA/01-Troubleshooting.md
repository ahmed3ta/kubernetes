# Troubleshooting
## Application Failure
### Check Accessability
1- start with the front-end
	a. use curl to check if it's accessible
	b. check the service if it's descovering and endpoint, and if it's not, check the pod, make sure that the pod and service ports and labels match
	c. check the pod and make sure it's on a running state (get, describe, logs -f --previous)
2- check the backend with the same steps

https://kubernetes.io/docs/tasks/debug/debug-application/

## Control Plane Failure
1- check the status of the nodes
2- check the components of the control plane (pods if they are deployed as pods) or check the services of the control plane if deployed as services 
    kube-apiserver -- control
	kube-controller-manager -- control
	kube-scheduler -- control
	kubelet -- worker
	kube-proxy -- worker
3- view the logs of the components
  -- incase of pods `kubectl logs kube-apiserver`
  -- incase of services `journalctl -u kube-apiserver` where kube-apiserver is a service
	
	
## Worker Node Failures
1- check the status of the nodes 
	`kubectl describe node`
	there are multiple flags that can be set to true, here are some flags:
	a- memory -- oom (out of memory flag)
	b- disk -- ood (out of disk)
	c- disk is low - diskpressure
	d- too many processes -- pidpressure 
	e- healthy -- ready flag
a status of unkown is set to a worker node that can not be reached by the control plane
checking the heartbeat might be a good approach to check the time when the worker node has crashed
2- check the memory, cpu, and disk space, and check the kubelet and it's logs and check the certificate
  a- df -h
  b- top
  c- systemctl status kubelet
  d- journalctl -u kubectl
  f- openssl x509 -in /var/lib/kubelet/cert.crt --text
  
