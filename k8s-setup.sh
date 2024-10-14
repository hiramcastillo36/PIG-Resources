#!/bin/bash

if [ ! -d ~/.kube ]; then
  mkdir ~/.kube
fi

cp config ~/.kube/config

kubectl config set-credentials oidc --exec-command=kubectl \
    --exec-api-version=client.authentication.k8s.io/v1beta1 \
    --exec-arg="oidc-login" \
    --exec-arg="get-token" \
    --exec-arg="--oidc-issuer-url=https://sso.lamod.unam.mx/auth/realms/cudi" \
    --exec-arg="--oidc-client-id=k8s" \
    --exec-arg="--oidc-client-secret=$1" \
    --kubeconfig=$KUBECONFIG