#!/bin/bash

CURRENT_DIR=$(dirname "$0")
source ${CURRENT_DIR}/vars.sh

cat ${CURRENT_DIR}/template/prefix.yaml > ${RULE_FILE_NAME}
yq p ${SUBSTRATE_RULES_FOLDER}/alerting-rules.yaml spec | sed 's/{{ \$labels\.instance.*\n*}}/{{`{{ $labels.instance }}`}}/g' - | sed 's/{{ $value.*\n*}}/{{`{{ $value }}`}}/g' - | yq w - "spec.groups[*].rules[*].labels.origin" "{{ .Values.deploymentName }}" | sed "s/'{{ .Values.deploymentName }}'/{{ .Values.deploymentName }}/g" - >> ${RULE_FILE_NAME}
cat ${CURRENT_DIR}/template/postfix.yaml >> ${RULE_FILE_NAME}
mv ${RULE_FILE_NAME} ${PROJECT_ROOT}/${CHART_FOLDER}

echo "imported new ${RULE_FILE_NAME}"
cat ${PROJECT_ROOT}/${CHART_FOLDER}/${RULE_FILE_NAME}