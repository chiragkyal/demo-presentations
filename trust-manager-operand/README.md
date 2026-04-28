# Trust Manager Operand for cert-manager Operator

A customer-facing presentation on distributing CA certificates across OpenShift clusters using the trust-manager operand, built with Go's [present](https://pkg.go.dev/golang.org/x/tools/cmd/present) tool.

Covers the trust-manager integration added to the [cert-manager Operator for Red Hat OpenShift](https://docs.redhat.com/en/documentation/openshift_container_platform/4.21/html/security_and_compliance/cert-manager-operator-for-red-hat-openshift#cert-manager-trust-manager) starting from v1.19.0 (Technology Preview).

## Running the Presentation

```bash
./start-presentation.sh
```

Or manually:

```bash
present
```

Then open http://127.0.0.1:3999 and click on `trust-manager-operand.slide`.

If `present` is not installed:

```bash
go install golang.org/x/tools/cmd/present@latest
export PATH=$PATH:$(go env GOPATH)/bin
```

## Presentation Outline

1. **The Problem** — why manual CA distribution doesn't scale
2. **What is trust-manager** — one-line value prop and key benefits
3. **Getting Started** — prerequisites, feature gates, install, verify
4. **Distributing Trust Bundles** — label namespaces, create a Bundle, verify targets
5. **Multi-Source Bundles** — combining ConfigMaps, Secrets, inline certs, and default CAs
6. **Configuration Options** — full CR walkthrough, Secret targets, default CA package
7. **Cleanup** — uninstall steps
8. **Summary** — key takeaways

## Files

- `trust-manager-operand.slide` — Main presentation
- `start-presentation.sh` — Quick start script
- `trust-manager-examples/` — YAML, shell, Go, and JSON examples referenced by the slides

## References

- [Product Documentation](https://docs.redhat.com/en/documentation/openshift_container_platform/4.21/html/security_and_compliance/cert-manager-operator-for-red-hat-openshift#cert-manager-trust-manager)
- [Upstream trust-manager](https://cert-manager.io/docs/trust/trust-manager/)
- [JIRA: CM-830](https://issues.redhat.com/browse/CM-830)

## Navigation

- Arrow keys to move between slides
- Browser full-screen: `F11` (or `Cmd+Ctrl+F` on macOS)
