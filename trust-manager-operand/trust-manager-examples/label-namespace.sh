#!/bin/bash

# START LABEL OMIT
# Create the namespace (if it doesn't already exist)
$ oc create namespace my-app-namespace

# Label it to receive trust bundles
$ oc label namespace my-app-namespace trust.cert-manager.io/inject=true

# Verify the label
$ oc get namespace my-app-namespace --show-labels
# END LABEL OMIT
