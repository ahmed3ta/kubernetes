#! /bin/bash
kubeadm init --pod-network-cidr 192.168.56.0/16 --apiserver-advertise-address=192.168.56.2 --cri-socket /run/cri-dockerd.sock | tee ./clutser-join-link.txt
export KUBECONFIG=/etc/kubernetes/admin.conf
