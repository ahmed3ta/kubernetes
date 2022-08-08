# Secrets

secrets are like configMaps, but they are encrypted and hashed on the system.

`kubectl create secret <secret-name> --from-literal=<key1>=<value1> --from-literal=<key2>=<value2>` --\> imperative

`kubectl create secret app-config --from-literal=DB_HOST=mysql --from-literal=DB_PASSWORD=mypassword`

`kubectl create secret <secret-name> --from-file=<file-path>`

`kube create -f secret.yaml` --\> declarative way

```YAML
apiVersion: v1
kind: Secret
metadata:
  creationTimestamp: null
  name: app-secret
data:
  COLOR: DB_HOST
  COLOR2: mysql
```

one thing needs to be done is to encode the value you need to store in the secret,

on linux, use the comand `echo -n "root" | base64` to encode the values

```YAML
apiVersion: v1
kind: Secret
metadata:
  creationTimestamp: null
  name: app-secret
data:
  COLOR: REJfSE9TVA==
  COLOR2: bXlzcWw=
```

and to decode `echo -n "bXlzcWw=" | base64 --decode`

to inject the secret into the pod definition file:

```YAML
spec:
  containers:
  - name: container1
    image: image-url
    ports:
    - containerPort: 8080
    envFrom:
    - secretRef:
      name: myapp-secret  #this is the secret that was created earlier
    restartPolicy: Never
```

### other use cases to configMaps

**single env:**

you can extract 1 env from the secret and use it in a pod definition file

```YAML
spec:
  containers
  - name:
    image:
    env:
    - name: APP_COLOR
      valueFrom:
        secretRef:
         name: myapp-secret
         key: DB_HOST
```

**volumes:**

```YAML
spec:
  containers:
    volumes:
    - name: app-volume
      secret:
        name: app-secret
```

if you were to mount the secret as a volum in the pod, each attribute in the secret is kept as a file with the value of the secret as it's content
