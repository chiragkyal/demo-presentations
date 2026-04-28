#!/bin/bash

# START FEATUREGATE OMIT
# Step 1: Enable TechPreview FeatureSet on the cluster
$ oc patch featuregate cluster --type=merge \
  -p '{"spec":{"featureSet":"TechPreviewNoUpgrade"}}'

# Step 2: Enable the TrustManager feature gate on the operator
$ oc -n cert-manager-operator patch subscription openshift-cert-manager-operator \
  --type='merge' \
  -p '{"spec":{"config":{"env":[{"name":"UNSUPPORTED_ADDON_FEATURES","value":"TrustManager=true"}]}}}'
# END FEATUREGATE OMIT
