# Docker Network

there are multiple network options

### 1- none network

`docker run --network none nginx` no one can reach the container

### 2- host network

container is attached to the host network and can be reached via host

### 3- Bridged Network

this is the default network which default ip range is 172.17.0.0, which means all the docker containers are on an internal private network

## Bridge

when docker is installed it created a private bridge network by default

![68689220217fef1113f5b7092f0a469c.png](../../_resources/68689220217fef1113f5b7092f0a469c.png)

note that the ip of the link is 172.17.0.1, and it's down state,

whenever you create a container, docker creates a network namespace for it. just like the usual netns ( sudo ip netns) and creates the virtual pipe connecting the virtual interface of the docker container with the docker bridge virtual connection.

## Port mapping in docker

if you need to curl a docker nginx image, from the docker host, it's easy to do so.

simply by adding -p option: docker run -p 8080:80 nginx

this simply creates a port mapping record on the host and can be found at `iptables -nvL -t nat`

`iptables -t nat -A PREROUTING -j DNAT --dport 8080 --to-port 80`

similarly: 

`iptables -t nat -A DOCKER -j DNAT -dport 8080 --to-port 172.17.0.2:80`