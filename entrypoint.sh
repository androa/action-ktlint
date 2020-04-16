#!/bin/sh
export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

set -o pipefail
set -x

cd "$GITHUB_WORKSPACE"

ktlint --reporter=checkstyle | tee report.xml
cat report.xml
cat report.xml | reviewdog -tee -f=checkstyle -name="ktlint" -reporter="${INPUT_REPORTER}" -level="${INPUT_LEVEL}"
