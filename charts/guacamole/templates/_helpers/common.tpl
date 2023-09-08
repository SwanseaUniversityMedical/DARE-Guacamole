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

{{/*
Construct the base name for all resources in this chart.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "guacamole.fullname" -}}
{{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Construct the `labels.app` for used by all resources in this chart.
*/}}
{{- define "guacamole.labels.app" -}}
{{- printf "%s" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Construct the `labels.chart` for used by all resources in this chart.
*/}}
{{- define "guacamole.labels.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Define the nodeSelector for guacamole pods
EXAMPLE USAGE: {{ include "guacamole.nodeSelector" (dict "Release" .Release "Values" .Values "nodeSelector" $nodeSelector) }}
*/}}
{{- define "guacamole.podNodeSelector" }}
{{- .nodeSelector | default .Values.guacamole.defaultNodeSelector | toYaml }}
{{- end }}

{{/*
Define the Affinity for guacamole pods
EXAMPLE USAGE: {{ include "guacamole.podAffinity" (dict "Release" .Release "Values" .Values "affinity" $affinity) }}
*/}}
{{- define "guacamole.podAffinity" }}
{{- .affinity | default .Values.guacamole.defaultAffinity | toYaml }}
{{- end }}

{{/*
Define the Tolerations for guacamole pods
EXAMPLE USAGE: {{ include "guacamole.podTolerations" (dict "Release" .Release "Values" .Values "tolerations" $tolerations) }}
*/}}
{{- define "guacamole.podTolerations" }}
{{- .tolerations | default .Values.guacamole.defaultTolerations | toYaml }}
{{- end }}

{{/*
Define the PodSecurityContext for guacamole pods
EXAMPLE USAGE: {{ include "guacamole.podSecurityContext" (dict "Release" .Release "Values" .Values "securityContext" $securityContext) }}
*/}}
{{- define "guacamole.podSecurityContext" }}
{{- .securityContext | default .Values.guacamole.defaultSecurityContext | toYaml }}
{{- end }}

{{/*
The list of `volumeMounts` for guacamole pods
EXAMPLE USAGE: {{ include "guacamole.volumeMounts" (dict "Release" .Release "Values" .Values "extraVolumeMounts" $extraVolumeMounts) }}
*/}}
{{- define "guacamole.volumeMounts" }}
{{- /* user-defined (global) */ -}}
{{- if .Values.guacamole.extraVolumeMounts }}
{{ toYaml .Values.guacamole.extraVolumeMounts }}
{{- end }}

{{- /* user-defined */ -}}
{{- if .extraVolumeMounts }}
{{ toYaml .extraVolumeMounts }}
{{- end }}
{{- end }}

{{/*
The list of `volumes` for guacamole pods
EXAMPLE USAGE: {{ include "guacamole.volumes" (dict "Release" .Release "Values" .Values "extraVolumes" $extraVolumes) }}
*/}}
{{- define "guacamole.volumes" }}
{{- /* user-defined (global) */ -}}
{{- if .Values.guacamole.extraVolumes }}
{{ toYaml .Values.guacamole.extraVolumes }}
{{- end }}

{{- /* user-defined */ -}}
{{- if .extraVolumes }}
{{ toYaml .extraVolumes }}
{{- end }}
{{- end }}

{{/*
The list of `env` vars for guacamole pods
EXAMPLE USAGE: {{ include "guacamole.env" (dict "Release" .Release "Values" .Values "extraEnv" $extraEnv) }}
*/}}
{{- define "guacamole.env" }}
{{- /* user-defined (global) */ -}}
{{- if .Values.guacamole.extraEnv }}
{{ toYaml .Values.guacamole.extraEnv }}
{{- end }}

{{- /* user-defined */ -}}
{{- if .extraEnv }}
{{ toYaml .extraEnv }}
{{- end }}
{{- end }}

{{/*
The list of `envFrom` vars for guacamole pods
EXAMPLE USAGE: {{ include "guacamole.envFrom" (dict "Release" .Release "Values" .Values "extraEnvFrom" $extraEnvFrom) }}
*/}}
{{- define "guacamole.envFrom" }}
{{- /* user-defined (global) */ -}}
{{- if .Values.guacamole.extraEnvFrom }}
{{ toYaml .Values.guacamole.extraEnvFrom }}
{{- end }}

{{- /* user-defined */ -}}
{{- if .extraEnvFrom }}
{{ toYaml .extraEnvFrom }}
{{- end }}
{{- end }}

{{/*
The list of `containers` vars for guacamole pods
EXAMPLE USAGE: {{ include "guacamole.containers" (dict "Release" .Release "Values" .Values "extraContainers" $extraContainers) }}
*/}}
{{- define "guacamole.containers" }}
{{- /* user-defined (global) */ -}}
{{- if .Values.guacamole.extraContainers }}
{{ toYaml .Values.guacamole.extraContainers }}
{{- end }}

{{- /* user-defined */ -}}
{{- if .extraContainers }}
{{ toYaml .extraContainers }}
{{- end }}
{{- end }}
