#!/bin/bash

# Exit script if any command fails
set -e

# Ensure the CHANGELOG.md file exists
if [ ! -f CHANGELOG.md ]; then
    echo "CHANGELOG.md not found!"
    exit 1
fi

# Extract the latest deploy section (everything between the first occurrence of "## Deploy:" and the next "## " or EOF)
LATEST_CHANGES=$(awk '/^## Deploy:/ {if (count++) exit} {print}' CHANGELOG.md)

# Check if changes exist
if [ -z "$LATEST_CHANGES" ]; then
    echo "No new changes found in CHANGELOG.md"
    exit 0
fi

# Slack Webhook URL (retrieved from GitLab CI/CD environment variable)
SLACK_WEBHOOK_URL=${SLACK_WEBHOOK_URL}

# Construct the Slack message with formatting
MESSAGE=":rocket: *Deployment Successful!* :white_check_mark:$LATEST_CHANGES"

# Use jq to properly escape the message as JSON
ESCAPED_MESSAGE=$(echo "$MESSAGE" | jq -Rs .)

# Send notification to Slack with a valid JSON payload
curl -X POST -H 'Content-type: application/json' --data "{\"text\": $ESCAPED_MESSAGE}" $SLACK_WEBHOOK_URL
