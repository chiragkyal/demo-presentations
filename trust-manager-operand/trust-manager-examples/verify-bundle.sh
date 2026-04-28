#!/bin/bash

# START BUNDLESTATUS OMIT
# Check Bundle status
$ oc get Bundle cluster-trust-bundle -o jsonpath='{.status.conditions}' | jq
[
  {
    "lastTransitionTime": "2026-03-27T12:03:42Z",
    "message": "Successfully synced Bundle to namespaces that match this label selector: trust.cert-manager.io/inject=true",
    "observedGeneration": 1,
    "reason": "Synced",
    "status": "True",
    "type": "Synced"
  }
]
# END BUNDLESTATUS OMIT

# START VERIFYTARGETS OMIT
# Verify target ConfigMap in a labeled namespace
$ oc get cm cluster-trust-bundle -n my-app-namespace
NAME                   DATA   AGE
cluster-trust-bundle   1      4m25s

# Verify target Secret (when secretTargets policy is Custom)
$ oc describe secret my-org-trust-bundle -n my-app-namespace
Name:         my-org-trust-bundle
Namespace:    my-app-namespace
Labels:       trust.cert-manager.io/bundle=my-org-trust-bundle
Annotations:  trust.cert-manager.io/hash: 55c00f81...

Type:  Opaque

Data
====
trust-bundle.pem:  219257 bytes
# END VERIFYTARGETS OMIT
