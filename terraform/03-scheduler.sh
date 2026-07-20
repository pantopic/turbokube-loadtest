#!/bin/bash
set -e

# https://kubernetes.io/docs/tasks/extend-kubernetes/configure-multiple-schedulers/

# mkdir -p /etc/systemd/system/kubelet.service.d
# cat > /etc/systemd/system/kubelet.service.d/20-labels-taints.conf <<EOF
# [Service]
# Environment="KUBELET_EXTRA_ARGS=--node-labels=pantopic/turbokube=scheduler --register-with-taints=pantopic/turbokube=scheduler:NoSchedule"
# EOF

kubeadm join 10.0.0.2:6443 --token x37d38.eira0dwtvkhb885w \
        --discovery-token-ca-cert-hash sha256:5bc6370afd1569ee5e9a1f22ff9007e54464fcf311d694c09f04333e34e5d97e

# Commands to apply taints and labels manually post-hoc
kubectl taint nodes scheduler-0 pantopic/turbokube=scheduler:NoSchedule
kubectl label nodes scheduler-0 pantopic/turbokube=scheduler
kubectl taint nodes scheduler-1 pantopic/turbokube=scheduler:NoSchedule
kubectl label nodes scheduler-1 pantopic/turbokube=scheduler
kubectl taint nodes scheduler-2 pantopic/turbokube=scheduler:NoSchedule
kubectl label nodes scheduler-2 pantopic/turbokube=scheduler
kubectl taint nodes scheduler-3 pantopic/turbokube=scheduler:NoSchedule
kubectl label nodes scheduler-3 pantopic/turbokube=scheduler

# ---


