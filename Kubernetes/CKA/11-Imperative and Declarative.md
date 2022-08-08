# Imperative and Declarative

Imperative way is specifying every step while Declarative is to just declare the final destination, meaning that Declarative way is specifying what to do without how to do it.

## Infrastructure as a code

imperative way is to specify all the steps needed for the infrastructure to be set up like: (provisioning the vm, install the nginx, edit the configrutaions and open port 8080, etc.)

while the declarive way is to just set the values needed like 
vm-name: webserver

package: nginx

port 8080

orchestration tools like Ansible, Puppet, Chef, or Terraform fall into this category.

* * *

in K8s case, the system should be intelegent enough to know the changes made and only apply those changes, meaning that if it finds the deployment with the same name, make sure that all configurations are the same, then it's a duplicate and does not do anything, or apply the changes, or create one if there is no similar one. this is the declarative way (apply, create from file)

the imparetive way on the other hand is used by kubectl create deploy/pod/svc/rc/rs/rq
