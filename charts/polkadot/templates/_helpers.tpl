{{/* Generates bootnodes string */}}
{{- define "polkadot-deployer.bootnodes" -}}
/dns4/polkadot-node-0/tcp/30333/p2p/{{ .Values.mainNodeID }}
{{- end }}

{{/* Returns custom-chainspec configmap name */}}
{{- define "polkadot-deployer.custom-chainspec-configmap" -}}
{{ .Chart.Name }}-custom-chainspec
{{- end }}

{{/* Returns the service account name */}}
{{- define "polkadot-deployer.serviceAccount" -}}
{{ .Chart.Name }}
{{- end }}

{{/* Returns the certificate name */}}
{{- define "polkadot-deployer.certificateName" -}}
{{ .Chart.Name }}
{{- end }}

{{/* Returns the TLS secret name */}}
{{- define "polkadot-deployer.tlsSecretName" -}}
{{ .Chart.Name }}
{{- end }}
