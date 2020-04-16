#!/bin/sh
export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

set -x

cd "$GITHUB_WORKSPACE"

ktlint --reporter=checkstyle \
  | reviewdog -f=checkstyle -name="ktlint" -reporter="${INPUT_REPORTER}" -level="${INPUT_LEVEL}"
