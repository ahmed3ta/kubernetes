# Rolling updates and roll-outs (roll backs)

when you first create a deployment it triggers a new roll out, a new roll out creates a new deployment revision.

when the new deployment is applied a new roll out, and a new revision is created, this helps in rollbacks.

`kubectl rollout status deployment/my-deployment`

`kubectl rollout history`

### Recreate Strategy:

this is a deployment strategy that destroys all existing pods and deploys the new version pods after that, and this creates a down time.

### Rolling Updates Strategy (Default)

this way it destroy a pod by pod, applying the new version, without the application to go down

## How to Update:

a way to do it is to make the changes needed in the manifest file and then run the apply command

`kubectl apply -f myapp.yaml`

another way to do it (not recommended) is to change the image by the set command

`kubectl set image deployment/myapp-deploy myapp.1.0=myapp.2.0`

this way is not recommended as the manifest file would have a different configurations that the deployment running

## Updates

when first applying the new deployment using the rolling update strategy a new replicaset is created creating the pods with the new version one at a time while destroying the old replicaset pods one at a time.

during the rollback, to a previous revision ( kubernetes allow you to rollback to a previous revision) the deployment is returning back to the previous replicaset

`kubectl rollout undo deployment myapp-deploy`