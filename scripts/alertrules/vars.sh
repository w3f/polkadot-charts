#!/bin/bash

SUBSTRATE_VER=v2.0.0-rc6
PROJECT_ROOT=`git rev-parse --show-toplevel`
TEST_FOLDER="tests/prometheus/polkadot"
CHART_FOLDER="charts/polkadot/templates"
RULE_FILE_NAME="alertrules-substrate.yaml"
TEST_FILE_NAME="alertrules-substrate.yaml"
SUBSTRATE_FOLDER="/tmp"
#SUBSTRATE_FOLDER=${PROJECT_ROOT}
SUBSTRATE_RULES_FOLDER=${SUBSTRATE_FOLDER}/substrate/.maintain/monitoring/alerting-rules