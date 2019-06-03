{{/* Generates bootnodes string */}}
{{- define "polkadot-deployer.bootnodes" -}}
/dns4/polkadot-node-0/tcp/30333/p2p/{{ .Values.mainNodeID }}
{{- end }}

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
