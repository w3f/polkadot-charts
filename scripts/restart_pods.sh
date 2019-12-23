#!/bin/bash
STATEFULSET_NAME=${1}

kubectl scale statefulset ${STATEFULSET_NAME} --replicas=0
kubectl scale statefulset ${STATEFULSET_NAME} --replicas=1
