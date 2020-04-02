{{/* Returns custom-chainspec configmap name */}}
{{- define "polkadot-deployer.custom-chainspec-configmap" -}}
{{ .Release.Name }}-custom-chainspec
{{- end }}

{{/* Returns the service account name */}}
{{- define "polkadot-deployer.serviceAccount" -}}
{{ .Release.Name }}
{{- end }}

{{/* Returns the certificate name */}}
{{- define "polkadot-deployer.certificateName" -}}
{{ .Release.Name }}
{{- end }}

{{/* Returns the TLS secret name */}}
{{- define "polkadot-deployer.tlsSecretName" -}}
{{ .Release.Name }}
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
{{ .Release.Name }}
{{- end }}

{{/* Returns the websockets domain */}}
{{- define "polkadot-deployer.websocketsDomain" -}}
{{ .Values.domain }}
{{- end }}

{{/* Returns the external websockets service name */}}
{{- define "polkadot-deployer.websocketService" -}}
{{ .Release.Name }}-external-websockets
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
{{ .Release.Name }}-external-bootnode
{{- end }}

{{/* Returns the external validator service name */}}
{{- define "polkadot-deployer.externalValidatorService" -}}
{{ .Release.Name }}-external-validator
{{- end }}

{{/* Returns the validator p2p domain */}}
{{- define "polkadot-deployer.p2pValidatorDomain" -}}
p2pv.{{ .Values.domain }}
{{- end }}
