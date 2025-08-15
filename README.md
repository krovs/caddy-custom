# Custom Caddy Build (Cloudflare DNS + Caddy-Security)

Multi-arch Caddy image with:

- [`caddy-dns/cloudflare`](https://github.com/caddy-dns/cloudflare) → DNS-01 TLS via Cloudflare (wildcards, no port 80)
- [`greenpau/caddy-security`](https://github.com/greenpau/caddy-security) → OIDC/auth for non-OIDC apps

**Image:** `ghcr.io/krovs/caddy-custom`  
**Architectures:** `amd64`, `arm64`, `arm/v7`  
**Tags:** `latest` (newest Caddy) + `vX.Y.Z` (pinned)

---

## Usage

**Pull:**

```bash
docker pull ghcr.io/krovs/caddy-custom:latest
```

**docker-compose.yml:**

```yaml
services:
  caddy:
    image: ghcr.io/krovs/caddy-custom:latest
    ports:
      - "80:80"
      - "443:443"
    environment:
      - CLOUDFLARE_API_TOKEN=${CLOUDFLARE_API_TOKEN}
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile
      - caddy_data:/data
      - caddy_config:/config
```

---

Built automatically on new Caddy releases.
