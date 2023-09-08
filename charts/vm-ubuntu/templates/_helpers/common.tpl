{{/*
Define the image configs for containers
EXAMPLE USAGE: {{ include "image" (dict "image" .Values.vm.image) }}
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
{{- define "vm.fullname" -}}
{{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Construct the `labels.app` for used by all resources in this chart.
*/}}
{{- define "vm.labels.app" -}}
{{- printf "%s" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Construct the `labels.chart` for used by all resources in this chart.
*/}}
{{- define "vm.labels.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Define the nodeSelector for vm pods
EXAMPLE USAGE: {{ include "vm.nodeSelector" (dict "Release" .Release "Values" .Values "nodeSelector" $nodeSelector) }}
*/}}
{{- define "vm.podNodeSelector" }}
{{- .nodeSelector | default .Values.vm.defaultNodeSelector | toYaml }}
{{- end }}

{{/*
Define the Affinity for vm pods
EXAMPLE USAGE: {{ include "vm.podAffinity" (dict "Release" .Release "Values" .Values "affinity" $affinity) }}
*/}}
{{- define "vm.podAffinity" }}
{{- .affinity | default .Values.vm.defaultAffinity | toYaml }}
{{- end }}

{{/*
Define the Tolerations for vm pods
EXAMPLE USAGE: {{ include "vm.podTolerations" (dict "Release" .Release "Values" .Values "tolerations" $tolerations) }}
*/}}
{{- define "vm.podTolerations" }}
{{- .tolerations | default .Values.vm.defaultTolerations | toYaml }}
{{- end }}

{{/*
Define the PodSecurityContext for vm pods
EXAMPLE USAGE: {{ include "vm.podSecurityContext" (dict "Release" .Release "Values" .Values "securityContext" $securityContext) }}
*/}}
{{- define "vm.podSecurityContext" }}
{{- .securityContext | default .Values.vm.defaultSecurityContext | toYaml }}
{{- end }}

{{/*
The list of `volumeMounts` for vm pods
EXAMPLE USAGE: {{ include "vm.volumeMounts" (dict "Release" .Release "Values" .Values "extraVolumeMounts" $extraVolumeMounts) }}
*/}}
{{- define "vm.volumeMounts" }}
{{- /* user-defined (global) */ -}}
{{- if .Values.vm.extraVolumeMounts }}
{{ toYaml .Values.vm.extraVolumeMounts }}
{{- end }}

{{- /* user-defined */ -}}
{{- if .extraVolumeMounts }}
{{ toYaml .extraVolumeMounts }}
{{- end }}
{{- end }}

{{/*
The list of `volumes` for vm pods
EXAMPLE USAGE: {{ include "vm.volumes" (dict "Release" .Release "Values" .Values "extraVolumes" $extraVolumes) }}
*/}}
{{- define "vm.volumes" }}
{{- /* user-defined (global) */ -}}
{{- if .Values.vm.extraVolumes }}
{{ toYaml .Values.vm.extraVolumes }}
{{- end }}

{{- /* user-defined */ -}}
{{- if .extraVolumes }}
{{ toYaml .extraVolumes }}
{{- end }}
{{- end }}

{{/*
The list of `env` vars for vm pods
EXAMPLE USAGE: {{ include "vm.env" (dict "Release" .Release "Values" .Values "extraEnv" $extraEnv) }}
*/}}
{{- define "vm.env" }}
{{- /* user-defined (global) */ -}}
{{- if .Values.vm.extraEnv }}
{{ toYaml .Values.vm.extraEnv }}
{{- end }}

{{- /* user-defined */ -}}
{{- if .extraEnv }}
{{ toYaml .extraEnv }}
{{- end }}
{{- end }}

{{/*
The list of `envFrom` vars for vm pods
EXAMPLE USAGE: {{ include "vm.envFrom" (dict "Release" .Release "Values" .Values "extraEnvFrom" $extraEnvFrom) }}
*/}}
{{- define "vm.envFrom" }}
{{- /* user-defined (global) */ -}}
{{- if .Values.vm.extraEnvFrom }}
{{ toYaml .Values.vm.extraEnvFrom }}
{{- end }}

{{- /* user-defined */ -}}
{{- if .extraEnvFrom }}
{{ toYaml .extraEnvFrom }}
{{- end }}
{{- end }}

{{/*
The list of `containers` vars for vm pods
EXAMPLE USAGE: {{ include "vm.containers" (dict "Release" .Release "Values" .Values "extraContainers" $extraContainers) }}
*/}}
{{- define "vm.containers" }}
{{- /* user-defined (global) */ -}}
{{- if .Values.vm.extraContainers }}
{{ toYaml .Values.vm.extraContainers }}
{{- end }}

{{- /* user-defined */ -}}
{{- if .extraContainers }}
{{ toYaml .extraContainers }}
{{- end }}
{{- end }}
