#!/bin/bash
set -e

export HOST_IP=$(ip addr show dev eth1 | grep 10.0 | tail -n 1 | awk '{print $2}' | sed 's/\/.*//')

kubeadm join 10.0.0.15:6443 --token 7hadz8.uuies23x1d5cxdmo \
        --discovery-token-ca-cert-hash sha256:6b92aebbeabe5f3d3153f01f5b18f2bfeb2ebd21ae9ad0c3ea222895cafc625a \
        --node-name "$(hostname)-$(echo $HOST_IP | sed 's/\./\-/g')"

echo "maxPods: 1000" >> /var/lib/kubelet/config.yaml
systemctl restart kubelet
