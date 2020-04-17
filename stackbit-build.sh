#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e9940b0c890ab001bc88632/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e9940b0c890ab001bc88632
curl -s -X POST https://api.stackbit.com/project/5e9940b0c890ab001bc88632/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e9940b0c890ab001bc88632/webhook/build/publish > /dev/null
