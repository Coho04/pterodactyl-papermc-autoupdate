#!/bin/bash

API_URL="https://api.papermc.io/v2/projects/paper"
LATEST_VERSION=$(curl -s "$API_URL" | jq -r '.versions[-1]')
BUILD=$(curl -s "$API_URL/versions/$LATEST_VERSION" | jq -r '.builds[-1]')

DOWNLOAD_URL="$API_URL/versions/$LATEST_VERSION/builds/$BUILD/downloads/paper-$LATEST_VERSION-$BUILD.jar"

OUTPUT_FILE="paper-$LATEST_VERSION-$BUILD.jar"
echo "Downloading latest PaperMC: $LATEST_VERSION build $BUILD..."
curl -o "$OUTPUT_FILE" "$DOWNLOAD_URL"

echo "Downloaded to $OUTPUT_FILE"

