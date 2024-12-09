#!/bin/bash
API_URL="https://api.papermc.io/v2/projects/paper"

LATEST_VERSION=$(curl -s "$API_URL" | grep -o '"versions":\["[^"]*' | sed 's/"versions":\["//' | tail -1)

BUILD=$(curl -s "$API_URL/versions/$LATEST_VERSION" | grep -o '"builds":\[[^]]*' | sed 's/"builds":\[//' | tr ',' '\n' | tail -1)

DOWNLOAD_URL="$API_URL/versions/$LATEST_VERSION/builds/$BUILD/downloads/paper-$LATEST_VERSION-$BUILD.jar"

OUTPUT_FILE="server.jar"

echo "Downloading latest PaperMC: $LATEST_VERSION build $BUILD..."
curl -o "$OUTPUT_FILE" "$DOWNLOAD_URL"

echo "Downloaded to $OUTPUT_FILE"
