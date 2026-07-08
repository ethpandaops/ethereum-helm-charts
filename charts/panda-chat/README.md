
# panda-chat

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2026.6.5](https://img.shields.io/badge/AppVersion-2026.6.5-informational?style=flat-square)

AI chat for an Ethereum devnet — an Open-WebUI front end backed by a NousResearch Hermes agent wired to the `panda` CLI, giving anyone access to devnet analytics (Xatu/Prometheus/Loki/Dora/Ethnode via panda-proxy), account funding (powfaucet) and join-the-devnet helpers.

**Homepage:** <https://github.com/ethpandaops/chat>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://helm.openwebui.com | open-webui | 14.5.0 |

## What this deploys

- **Open-WebUI** front end (subchart) on `chat.<network>` — the chat UI.
- **Hermes agent** (NousResearch) as an OpenAI-compatible backend, wired to
  the **`panda` CLI** for live devnet analytics (Xatu / Prometheus / Loki /
  Dora / Ethnode via the hosted panda-proxy).
- Agent **skills** for the EthPandaOps tools: `panda` (query), `faucet`
  (fund accounts via the devnet powfaucet) and `join-devnet` (enodes /
  bootnodes / genesis from the devnet `config` service).
- Optional **Langfuse** tracing (`langfuse.enabled`) via Hermes' bundled
  `observability/langfuse` plugin — one span per turn, one generation per LLM
  call, one observation per tool call; traces tagged with the devnet name.

When `panda.enabled` is true the pod gains a separate **`panda-server`
sidecar container**; both containers run **unprivileged**. The sandbox is the
`direct` backend — executed Python runs as a subprocess inside the panda-server
container, isolated by the Kubernetes pod boundary (no dockerd, no sandbox
image, no privilege). The bot identity for the proxy is an Authentik **service
account** (e.g. `panda-chat-svc` with a non-expiring app password) supplied via
`credentials.panda.botUsername` / `credentials.panda.botToken` and materialized
in a **dedicated Secret that only the sidecar mounts** — Hermes executes
LLM-driven shell commands, so it never shares an environment with the bot
credential. panda-server mints proxy access tokens on demand with the OAuth2
`client_credentials` grant and keeps them in memory only — no seeded credential
files, no refresh-token rotation. Hermes reaches the sidecar on
`127.0.0.1:2480` (shared pod network namespace).

## Access control

The chart serves a **public** ingress by default (like Dora). Because the agent
incurs real LLM spend, gate it to your org with **Cloudflare Access** — the same
edge gate the devnet already runs (authenticatoor / faucet rely on it). CF Access
verifies org membership and passes the identity to the origin as
`Cf-Access-Authenticated-User-Email`; Open-WebUI consumes it as **trusted-header
SSO** (no password), auto-provisioning the user on first visit.

1. Create a Cloudflare Access application on `chat.<network>` scoped to the org
   (e.g. the ethpandaops GitHub org). This is the only out-of-band step — the same
   primitive that already gates `auth.<network>`.
2. Enable trusted-header SSO:

   ```yaml
   open-webui:
     sso:
       enabled: true
       enableSignup: true            # auto-provision on first login
       trustedHeader:
         enabled: true
         emailHeader: Cf-Access-Authenticated-User-Email
     extraEnvVars:
       - name: ENABLE_LOGIN_FORM      # hide the password form
         value: "false"
   ```

> ⚠️ Trust model: the chat host must only be reachable **via Cloudflare**, so the
> email header can't be spoofed by hitting the origin directly — the same
> assumption authenticatoor and the rest of the devnet stack already rely on.

Per-user identity is also propagated to the agent: the Open-WebUI image
(`ethpandaops/open-webui-cf`) forwards `Cf-Access-Jwt-Assertion` upstream so
Hermes can attribute traffic to the individual user (Langfuse `user_id`,
`X-Panda-On-Behalf-Of` audit header). Authentication to panda-proxy itself is
always the bot service account. On devnets the bal-devnets ansible template
wires the trusted-header config from a single toggle — see `chat.yaml.j2`.

## Image

Two images, both built from [`ethpandaops/chat`](https://github.com/ethpandaops/chat):

- `image.repository` (`ethpandaops/hermes-agent-panda`) — the Hermes agent
  with the panda overlay (panda CLI + panda-server + sandbox Python env +
  entrypoint + skills).
- `open-webui.image` (`ethpandaops/open-webui-cf`) — Open-WebUI patched to
  forward the Cloudflare Access JWT to the agent (see [Access control](#access-control)).
  Its tag must match the `open-webui` subchart appVersion.

## Wiring the front end to the agent

The chart does not assume the release name, so set the agent endpoint on the
subchart (the bal-devnets ansible template does this automatically):

```yaml
open-webui:
  openaiBaseApiUrls:
    - "http://<release>-hermes:8642/v1"
  extraEnvVars:
    - name: OPENAI_API_KEYS
      valueFrom:
        secretKeyRef:
          name: <release>-hermes-secret
          key: API_SERVER_KEY
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity for the agent pod |
| chainId | string | `""` | The devnet chain id (informational; surfaced to the join-devnet skill). |
| credentials.apiServerKey | string | `""` | Stable OW<->Hermes bearer (`API_SERVER_KEY`). Leave empty for a bare `helm install` (auto-generated + preserved). Under GitOps/ArgoCD you MUST set this to a stable value (sops) — `helm template` can't preserve a generated one, so an empty value drifts OW and Hermes apart on re-render. |
| credentials.langfuse.publicKey | string | `""` | Langfuse public key (pk-lf-...) |
| credentials.langfuse.secretKey | string | `""` | Langfuse secret key (sk-lf-...) |
| credentials.llmApiKey | string | `""` | The LLM API key value (materialized into the Secret under `llm.apiKeyEnv`) |
| credentials.panda.botToken | string | `""` | Authentik app-password token for the bot service account (client_credentials grant; minted tokens stay in memory). Required when `panda.enabled`. |
| credentials.panda.botUsername | string | `""` | Authentik service-account username for the bot (e.g. `panda-chat-svc`). Required when `panda.enabled`. |
| devnetTools.faucet.enabled | bool | `true` | Enable the faucet (account funding) skill |
| devnetTools.faucet.url | string | `""` | powfaucet base URL |
| devnetTools.join.configUrl | string | `""` | Base config service URL (serves /cl/config.yaml, /el/enodes.txt, etc.) |
| devnetTools.join.enabled | bool | `true` | Enable the join-devnet skill |
| devnetTools.join.explorerUrl | string | `""` | Block explorer URL |
| devnetTools.join.rpcUrl | string | `""` | Public execution RPC URL |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"ethpandaops/hermes-agent-panda"` | Panda-overlay Hermes agent image (Hermes + panda CLI + panda-server). |
| image.tag | string | `""` | Image tag. Defaults to the chart appVersion when empty. |
| imagePullSecrets | list | `[]` | Image pull secrets for the agent image |
| langfuse.baseUrl | string | `""` | Langfuse base URL |
| langfuse.enabled | bool | `false` | Enable Langfuse tracing |
| langfuse.env | string | `""` | Environment tag on traces (defaults to `network` when empty) |
| llm.apiKeyEnv | string | `"ANTHROPIC_API_KEY"` | Env var the agent reads the model key from (must match a key materialized by `credentials`) |
| llm.apiMode | string | `""` | Hermes api_mode (chat_completions / anthropic_messages / ...); auto-detected from URL when empty |
| llm.baseUrl | string | `""` | Base URL override (required for `custom`; optional override otherwise) |
| llm.model | string | `"claude-sonnet-4-6"` | Model identifier |
| llm.provider | string | `"anthropic"` | Hermes provider name (anthropic / openai / custom / minimax / ...) |
| nameOverride | string | `""` | Overrides the chart's name |
| network | string | `""` | The devnet network this chat serves (e.g. `bal-devnet-7`). Used to scope panda queries and surfaced to the agent so it answers in-context. |
| nodeSelector | object | `{}` | Node selector for the agent pod |
| open-webui.enabled | bool | `true` | Render the Open-WebUI front end |
| open-webui.extraEnvVars[0].name | string | `"ENABLE_OLLAMA_API"` |  |
| open-webui.extraEnvVars[0].value | string | `"false"` |  |
| open-webui.image.repository | string | `"ethpandaops/open-webui-cf"` |  |
| open-webui.image.tag | string | `"0.9.5"` |  |
| open-webui.ingress.annotations | object | `{}` |  |
| open-webui.ingress.class | string | `"ingress-nginx-public"` |  |
| open-webui.ingress.enabled | bool | `true` |  |
| open-webui.ingress.host | string | `""` |  |
| open-webui.ollama.enabled | bool | `false` |  |
| open-webui.persistence.enabled | bool | `true` |  |
| open-webui.persistence.size | string | `"5Gi"` |  |
| open-webui.pipelines.enabled | bool | `false` |  |
| open-webui.replicaCount | int | `1` |  |
| open-webui.sso.enableSignup | bool | `true` |  |
| open-webui.sso.enabled | bool | `false` |  |
| open-webui.sso.trustedHeader.emailHeader | string | `"Cf-Access-Authenticated-User-Email"` |  |
| open-webui.sso.trustedHeader.enabled | bool | `false` |  |
| open-webui.sso.trustedHeader.nameHeader | string | `""` |  |
| open-webui.websocket.enabled | bool | `false` |  |
| open-webui.websocket.redis.enabled | bool | `false` |  |
| panda.clientId | string | `"panda-proxy"` | OAuth client id at the proxy |
| panda.enabled | bool | `true` | Enable the panda-server sidecar container (holds the bot credential) |
| panda.issuerUrl | string | `"https://authentik.analytics.production.platform.ethpandaops.io/application/o/panda-proxy/"` | Authentik application issuer the bot service account mints client_credentials tokens against (the trailing slash is part of the issuer — keep it) |
| panda.proxyUrl | string | `"https://panda-proxy.analytics.production.platform.ethpandaops.io"` | Hosted panda-proxy URL (analytics data plane) |
| panda.resources | object | `{"limits":{"cpu":"1000m","memory":"2Gi"},"requests":{"cpu":"200m","memory":"512Mi"}}` | Resources for the panda-server sidecar |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Access modes |
| persistence.enabled | bool | `true` | Enable a PVC for /opt/data (Hermes state + panda config/creds/storage) |
| persistence.existingClaim | string | `""` | Use an existing claim instead of creating one |
| persistence.size | string | `"8Gi"` | PVC size |
| persistence.storageClass | string | `""` | Storage class (cluster default when empty) |
| resources | object | `{"limits":{"cpu":"1000m","memory":"2Gi"},"requests":{"cpu":"200m","memory":"768Mi"}}` | Resources for the hermes container (panda-server sidecar sized separately under `panda.resources`) |
| service.port | int | `8642` | Agent service port (Hermes OpenAI-compatible API) |
| service.type | string | `"ClusterIP"` | Agent service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Create a service account for the agent |
| serviceAccount.name | string | `""` | Service account name (defaults to the fullname) |
| systemPrompt | string | `"You are the EthPandaOps assistant for the Ethereum devnet \"{{ network }}\", scoped to it alone.\nTools: `panda` (query live data), `faucet` (fund accounts), `join-devnet` (join the network).\nDiscover before querying (the `panda` skill shows how); never invent APIs, tables, or node names.\nReport exactly what the tools return — never fabricate; if data is missing or sources disagree, say so.\nLead with the numbers, in plain English. Be concise.\n"` | System prompt for the agent. `{{ network }}` is substituted at render time. |
| tolerations | list | `[]` | Tolerations for the agent pod |
