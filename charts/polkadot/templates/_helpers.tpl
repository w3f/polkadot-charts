{{/* Generates bootnodes string */}}
{{- define "polkadot-deployer.bootnodes" -}}
{{- range .Values.bootNodes }}--bootnodes={{ . }} {{ end -}}
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

{{/* Returns the telemetry parameter content */}}
{{- define "polkadot-deployer.telemetry" -}}
{{- if .Values.telemetry }}--telemetry-url={{ .Values.telemetry }} {{ end -}}
{{- end }}

{{/* Returns the p2p service name */}}
{{- define "polkadot-deployer.p2pService" -}}
{{ .Release.Name }}-p2p
{{- end }}

{{/* Returns the bootnode service name */}}
{{- define "polkadot-deployer.bootnodeService" -}}
{{ .Release.Name }}-bootnode
{{- end }}

{{/* Returns the chainspec to use */}}
{{- define "polkadot-deployer.chainspecName" -}}
{{- if .Values.chainspec.preset -}}
{{ .Values.chainspec.name }}
{{- else -}}
{{ .Values.chainspec.basePath }}/{{ .Values.chainspec.name }}
{{- end -}}
{{- end }}

{{/* Returns the name of the VPN secret */}}
{{- define "polkadot-deployer.vpnSecret" -}}
polkadot-vpn
{{- end }}

{{/* Returns the common name for VPN resources */}}
{{- define "polkadot-deployer.vpnCommonName" -}}
polkadot-vpn
{{- end }}

{{/* Returns the VPN domain */}}
{{- define "polkadot-deployer.vpnDomain" -}}
vpn.{{ .Values.domain }}
{{- end }}

{{/* Returns the VPN container name */}}
{{- define "polkadot-deployer.vpnContainerName" -}}
polkadot-vpn-connector
{{- end }}
