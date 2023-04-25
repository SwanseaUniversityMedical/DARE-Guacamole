{{/*
Construct the hostname for talking to guacd.
*/}}
{{- define "guacd.hostname" -}}
guacd.guacamole.svc.cluster.local
{{- end -}}
