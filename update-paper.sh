#!/bin/bash

API_URL="https://api.papermc.io/v2/projects/paper"
LATEST_VERSION=$(curl -s "$API_URL" | jq -r '.versions[-1]')
BUILD=$(curl -s "$API_URL/versions/$LATEST_VERSION" | jq -r '.builds[-1]')

DOWNLOAD_URL="$API_URL/versions/$LATEST_VERSION/builds/$BUILD/downloads/paper-$LATEST_VERSION-$BUILD.jar"

OUTPUT_FILE="paper-$LATEST_VERSION-$BUILD.jar"
echo "Downloading latest PaperMC: $LATEST_VERSION build $BUILD..."
curl -o "$OUTPUT_FILE" "$DOWNLOAD_URL"

echo "Downloaded to $OUTPUT_FILE"



API_URL="https://api.papermc.io/v2/projects/paper" && LATEST_VERSION=$(curl -s "$API_URL" | grep -oP '"versions":\["\K[^"]+' | tail -1) && LATEST_BUILD=$(curl -s "$API_URL/versions/$LATEST_VERSION" | grep -oP '"builds":\[\K[^]]+' | tr ',' '\n' | tail -1) && DOWNLOAD_URL="$API_URL/versions/$LATEST_VERSION/builds/$LATEST_BUILD/downloads/paper-$LATEST_VERSION-$LATEST_BUILD.jar" && echo "Downloading latest PaperMC: $LATEST_VERSION build $LATEST_BUILD..." && curl -o server.jar "$DOWNLOAD_URL" && echo "Downloaded to server.jar" && java -Xms128M -XX:MaxRAMPercentage=95.0 -Dterminal.jline=false -Dterminal.ansi=true -jar server.jar
