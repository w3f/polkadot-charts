#!/bin/bash

set -euo pipefail
set -x

TEST_FOLDER="tests/prometheus"
for file in $(find "${TEST_FOLDER}" -name *yaml | sed 's|^'"${TEST_FOLDER}"/'||'); do
    chart_name=${file%%/*}
    template_name=${file##*/}

    helm template -x "templates/${template_name}" "charts/${chart_name}" | yq r - spec | promtool check rules /dev/stdin
    helm template --set monitoring=true -x "templates/${template_name}" "charts/${chart_name}" | yq r - spec | promtool test rules "${TEST_FOLDER}/${chart_name}/${template_name}"
done
