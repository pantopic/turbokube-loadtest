#!/bin/bash
set -e

export HOST_IP=$(ip addr show dev eth1 | grep 10.0 | tail -n 1 | awk '{print $2}' | sed 's/\/.*//')

kubeadm join 10.0.0.4:6443 --token yevpkn.iho5p6mj3zzem89y \
        --discovery-token-ca-cert-hash sha256:331b9083ae078c9dce8dbf9e2f52a155ed69b960e5a910a5385b0e828d182d39 \
        --node-name "$(hostname)-$(echo $HOST_IP | sed 's/\./\-/g')"

echo "maxPods: 1000" >> /var/lib/kubelet/config.yaml
systemctl restart kubelet
