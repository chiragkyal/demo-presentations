# Proxy Configuration in OpenShift Operators

A presentation on making Kubernetes operators proxy-aware in OpenShift, built with Go's [present](https://pkg.go.dev/golang.org/x/tools/cmd/present) tool.

The implementation of these concepts for the External Secrets Operator can be found in [openshift/external-secrets-operator#62](https://github.com/openshift/external-secrets-operator/pull/62).

## Running the Presentation

```bash
./start-presentation.sh
```

Or manually:

```bash
present
```

Then open http://127.0.0.1:3999 and click on `proxy-configuration.slide`.

If port 3999 is already in use:

```bash
present -http=:8080
```

If `present` is not installed:

```bash
go install golang.org/x/tools/cmd/present@latest
export PATH=$PATH:$(go env GOPATH)/bin
```

Make sure to run `present` from the directory containing the `.slide` file and the `proxy-examples/` directory.

## Files

- `proxy-configuration.slide` — Main presentation file (Go present format)
- `start-presentation.sh` — Quick start script

### Example Code (`proxy-examples/`)

**YAML:**
- `proxy-config.yaml` — Cluster proxy configuration
- `ca-configmap.yaml` — User CA bundle
- `configmap-empty.yaml` — Empty ConfigMap with injection label
- `configmap-injected.yaml` — ConfigMap after CNO injection
- `kustomization.yaml` — Kustomize configuration
- `manager-deployment.yaml` — Operator deployment with CA mount

**Go:**
- `reconciler-configmap.go` — Creating trusted CA ConfigMap
- `reconciler-proxy.go` — Getting and setting proxy configuration
- `reconciler-volume.go` — Volume and mount management
- `reconciler-apply.go` — Applying proxy settings to all containers
- `controller-setup.go` — Controller setup with metadata watching
- `controller-predicates.go` — Custom predicates for filtering

## Presentation Outline

1. **Why Proxy Configuration Matters** — Enterprise network requirements, security and compliance
2. **Configuring the OpenShift Cluster-Wide Proxy** — CA bundles, Proxy resource, noProxy considerations
3. **Cluster Network Operator (CNO) Role** — CA bundle injection, the `config.openshift.io/inject-trusted-cabundle` label, ownership model
4. **OLM and Operator Proxy Configuration** — Env var injection, trusted CA bundle mounting, Kustomize configMapGenerator
5. **Making Operand Pods Proxy-Aware** — Creating trusted CA ConfigMap in operand namespace, proxy env vars (uppercase + lowercase), certificate mounting, init container support
6. **Watching ConfigMap Changes** — Why metadata-only watching matters, `WatchesMetadata` vs `Watches`, predicates for efficient filtering
7. **Complete Example** — End-to-end reconciler and controller setup
8. **Best Practices** — Implementation checklist, configuration precedence, graceful degradation

## Key Takeaways

- **CNO owns ConfigMap data, operators own labels** — never modify injected ConfigMap data directly
- **Use `WatchesMetadata`** to avoid race conditions with CNO during reconciliation
- **Set both uppercase and lowercase** proxy env vars (`HTTP_PROXY`/`http_proxy`, etc.)
- **Include init containers** — they need proxy settings too
- **Handle missing proxy config gracefully** — not every cluster runs behind a proxy

## Navigation

- Arrow keys to move between slides
- `F` for full-screen, `Esc` for slide overview
- Code examples are loaded from files in `proxy-examples/`
- Lines with `// HL` are highlighted in the presentation
