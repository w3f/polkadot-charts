{{/* Returns custom-chainspec configmap name */}}
{{- define "polkadot-deployer.custom-chainspec-configmap" -}}
polkadot-custom-chainspec
{{- end }}

{{/* Returns the service account name */}}
{{- define "polkadot-deployer.serviceAccount" -}}
polkadot
{{- end }}

{{/* Returns the certificate name */}}
{{- define "polkadot-deployer.certificateName" -}}
polkadot
{{- end }}

{{/* Returns the TLS secret name */}}
{{- define "polkadot-deployer.tlsSecretName" -}}
polkadot
{{- end }}

{{/* Returns the session key secret name */}}
{{- define "polkadot-deployer.sessionKey" -}}
{{ .Release.Name }}-session-key
{{- end }}

{{/* Returns the node key secret name */}}
{{- define "polkadot-deployer.nodeKey" -}}
{{ .Release.Name }}-node-key
{{- end }}

{{/* Returns the PSP name */}}
{{- define "polkadot-deployer.podSecurityPolicyName" -}}
polkadot
{{- end }}

{{/* Returns the websockets domain */}}
{{- define "polkadot-deployer.websocketsDomain" -}}
{{ .Values.domain }}
{{- end }}

{{/* Returns the external websockets service name */}}
{{- define "polkadot-deployer.websocketService" -}}
polkadot-external-websockets
{{- end }}

{{/* Returns the p2p domain */}}
{{- define "polkadot-deployer.p2pDomain" -}}
p2p.{{ .Values.domain }}
{{- end }}

{{/* Returns the grafana domain */}}
{{- define "polkadot-deployer.grafanaDomain" -}}
grafana.{{ .Values.domain }}
{{- end }}

{{/* Returns the external boot node service name */}}
{{- define "polkadot-deployer.externalBootNodeService" -}}
polkadot-external-bootnode
{{- end }}
