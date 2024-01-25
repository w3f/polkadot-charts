{{/* Generates bootnodes string */}}
{{- define "polkadot-deployer.bootnodes" -}}
{{- range .Values.bootNodes }}--bootnodes={{ . }} {{ end -}}
{{- end }}

{{/* Returns custom-chainspec configmap name */}}
{{- define "polkadot-deployer.custom-chainspec-configmap" -}}
polkadot-custom-chainspec
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

{{/* Returns the websocket-rpc service name */}}
{{- define "polkadot-deployer.websocketService" -}}
{{ .Release.Name }}-ws-rpc
{{- end }}

{{/* Returns the telemetry parameter content */}}
{{- define "polkadot-deployer.telemetry" -}}
{{- if .Values.telemetry }}--telemetry-url={{ .Values.telemetry }} {{ end -}}
{{- end }}

{{/* Returns the p2p service name */}}
{{- define "polkadot-deployer.p2pService" -}}
{{ .Release.Name }}-p2p
{{- end }}

{{/* Returns the http RPC service name */}}
{{- define "polkadot-deployer.metricsService" -}}
{{ .Release.Name }}-metrics
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

{{/* Returns the statefulset name */}}
{{- define "polkadot-deployer.statefulsetName" -}}
{{ .Release.Name }}
{{- end }}

{{/* Returns the default name to use with session injection related resources */}}
{{- define "polkadot-deployer.sessionInjectionName" -}}
{{ .Release.Name }}-session-injection
{{- end }}

{{/* Returns the default name to use with pod restarter  related resources */}}
{{- define "polkadot-deployer.podRestarterName" -}}
{{ .Release.Name }}-pod-restarter
{{- end }}

{{/* Json for private docker registry */}}
{{- define "imagePullSecret" }}
{{- with .Values.imagePullSecret.imageCredentials }}
{{- printf "{\"auths\":{\"%s\":{\"username\":\"%s\",\"password\":\"%s\",\"email\":\"%s\",\"auth\":\"%s\"}}}" .registry .username .password .email (printf "%s:%s" .username .password | b64enc) | b64enc }}
{{- end }}
{{- end }}
