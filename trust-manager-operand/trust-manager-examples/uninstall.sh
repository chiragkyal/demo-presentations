#!/bin/bash

# START UNINSTALL OMIT
# Step 1: Delete all Bundle CRs first
$ oc get Bundle
$ oc delete Bundle <bundle_name>

# Step 2: Delete the TrustManager CR
$ oc delete TrustManager cluster

# Step 3: Delete namespace-scoped resources
$ oc delete deployments,services,serviceaccounts,configmaps,certificates,issuers \
    -l "app.kubernetes.io/name=cert-manager-trust-manager" -n cert-manager

# Step 4: Delete cluster-scoped resources
$ oc delete clusterroles,clusterrolebindings,validatingwebhookconfigurations \
    -l "app.kubernetes.io/name=cert-manager-trust-manager"

# Step 5: If custom trust namespace was used
$ oc delete roles,rolebindings \
    -l "app.kubernetes.io/name=cert-manager-trust-manager" -n <trust_namespace>
# END UNINSTALL OMIT
