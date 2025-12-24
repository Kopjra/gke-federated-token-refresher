#!/bin/sh
if [ -z "${1}" ]; then
  echo "The first argument must be set to the Google IAM Service Account Unique ID"
  exit 2
fi
if [ -z "${2}" ]; then
  echo "The second argument must be set to the path of the file of the gcp federated token to write"
  exit 2
fi

while true; do
  TOKEN=$(curl -f -sH "Metadata-Flavor: Google" \
    "http://metadata/computeMetadata/v1/instance/service-accounts/default/identity?audience=${1}&format=full&licenses=FALSE" 2>/dev/null)
  EXIT_CODE=$?

  if [ $EXIT_CODE -eq 0 ]; then
    echo "$TOKEN" > "$2"
    echo "Federated token successfully fetched"
  else
    echo "Error: Failed to fetch federated token (exit code: $EXIT_CODE)" >&2
  fi

  sleep 900
done