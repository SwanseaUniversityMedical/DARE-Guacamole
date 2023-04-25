{{/*
Define the image configs for containers
EXAMPLE USAGE: {{ include "image" (dict "image" .Values.guacamole.image) }}
*/}}
{{- define "image" }}
image: {{ .image.repository }}:{{ .image.tag }}
imagePullPolicy: {{ .image.pullPolicy }}
securityContext:
  runAsUser: {{ .image.uid }}
  runAsGroup: {{ .image.gid }}
{{- end }}
