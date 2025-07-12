| Feature                              | Implemented                               |
| ------------------------------------ | ----------------------------------------  |
| Vault-backed secrets (no hardcoding) | ✅                                        |
| AppRole service auth                 | ✅                                        |
| Docker service isolation             | ✅ (`internal` network only)              |
| HTTPS routing via Traefik            | ✅ (Port `8443` with `secure` entrypoint) |
| Input validation in API              | ✅ (Assumed from spec)                    |
| Environment variable fallback                         | ✅                       |
| HTTPS via self-signed TLS                             | ✅ Traefik on port 8443  |
| Vault secrets stored securely                         | ✅ Docker secrets        |
| No secret `.env` files checked in                     | ✅                       |
| Secrets injected at runtime                           | ✅ via `/run/secrets/`   |
| Backend never exposes credentials in code or env logs | ✅                       |


# 1. Start services
make up

# 2. Initialize Vault, policies, and AppRole
make setup

# 3. Run health and user API tests
make test


///////
make setup
make secrets
make up
