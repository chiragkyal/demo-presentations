#!/bin/bash

# START VERIFY OMIT
# Check TrustManager CR status
$ oc get TrustManager cluster
NAME      READY   MESSAGE                      AGE
cluster   True    reconciliation successful    2m

# Check trust-manager deployment
$ oc get deployments -l "app.kubernetes.io/name=cert-manager-trust-manager" -n cert-manager
NAME            READY   UP-TO-DATE   AVAILABLE   AGE
trust-manager   1/1     1            1           109s

# Check trust-manager pod
$ oc get pods -l "app.kubernetes.io/name=cert-manager-trust-manager" -n cert-manager
NAME                             READY   STATUS    RESTARTS   AGE
trust-manager-547bb59b4b-hd6mv   1/1     Running   0          24s
# END VERIFY OMIT
