# Viewing Certificate Details

the first thing you need to do to view the certificate is to know how the cluster is setup.

you need to view certificate details by a health check spread sheet

and then look at the certificate contents using this command

`openssl x509 -in /etc/kubernetes/pki/apiserver-crt -text -noout`

another way to inspect if there is any issued, is to see the system logs 

`journalcrl -u etcd.service -l`

`kubectl logs etcd-master # that is the pod name`