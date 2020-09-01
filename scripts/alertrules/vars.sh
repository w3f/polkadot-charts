#!/bin/bash

SUBSTRATE_VER=v2.0.0-rc6
PROJECT_ROOT=`git rev-parse --show-toplevel`
TEST_FOLDER="tests/prometheus/polkadot"
CHART_FOLDER="charts/polkadot/templates"
RULE_FILE_NAME="alertrules-substrate2.yaml"
TEST_FILE_NAME="alertrules-substrate2.yaml"
SUBSTRATE_FOLDER="/tmp/substrate"
SUBSTRATE_RULES_FOLDER=${SUBSTRATE_FOLDER}/.maintain/monitoring/alerting-rules