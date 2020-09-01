#!/bin/bash

CURRENT_DIR=$(dirname "$0")
source ${CURRENT_DIR}/vars.sh

yq w ${SUBSTRATE_RULES_FOLDER}/alerting-rule-tests.yaml "tests[*].alert_rule_test[*].exp_alerts[*].exp_labels.origin" testnet-0 | sed 's/{}//g' - > ${PROJECT_ROOT}/${TEST_FOLDER}/${TEST_FILE_NAME}