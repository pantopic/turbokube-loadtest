#!/bin/bash
set -e

# https://kubernetes.io/docs/tasks/extend-kubernetes/configure-multiple-schedulers/

# mkdir -p /etc/systemd/system/kubelet.service.d
# cat > /etc/systemd/system/kubelet.service.d/20-labels-taints.conf <<EOF
# [Service]
# Environment="KUBELET_EXTRA_ARGS=--node-labels=pantopic/turbokube=scheduler --register-with-taints=pantopic/turbokube=scheduler:NoSchedule"
# EOF

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


