# Commands, Args, and Environmental Variables

in docker world, if you need to have an Entry point you simply explicitly tell it to by:

docker run ubuntu --entrypoint sleep 10 which is a command that is already exists in the docker file of the image ( or not but we need it to run) and args are the arguments needed in these commands mostly

so the manifest would be:

```YAML
apiVersion: v1
kind: Pod
metadata:
        name: sleepyme-pod
spec:
        containers:
                - name: sleepyme
                  image: sleepyme:latest
                  command: ["sleep"]
                  args: ["10"]
```

meaning that the **ENTRYPOINT** instruction refers to **command** item in the manifests, and the **CMD** instruction refers to **args**

* * *

## Environmental Variables

to make an Environmental Variable in docker:

docker run -e APP_COLOR=PINK simple-color-app

the equivalent in the yaml manifest file is env which an example for it is:

```YAML
spec:
  env:
  - name: APP_COLOR
    value: PINK
```

 please note that env is an array ( list of dictionaries) which must starts with -

This method is called plane name/value formate, however there are other ways to specify an environmental variable to be used like configmaps or secrets in the following:

```YAML
spec:
  env:
  - name: APP_COLOR
    valueFrom:
      configMapKeyRef:
```

```YAML
spec:
  env:
  - name: APP_COLOR
    valueFrom:
      secretKeyRef:
```
