#!/usr/bin/with-contenv bashio

# Fail hard on errors.
set -euo pipefail

# Load configurable options from options.json.
echo "Loading configuration..."
home_id="$(bashio::config 'home_id')"
gcp_project_id="$(bashio::config 'gcp_project_id')"
export HOME_ID="${home_id}"
export GCP_PROJECT_ID="${gcp_project_id}"

# Load GCP service account.
service_account_json="$(bashio::config 'service_account_json')"
echo "$service_account_json" > /service_account.json
export GOOGLE_APPLICATION_CREDENTIALS="/service_account.json"

# Set environment variables for websocket API access.
# https://developers.home-assistant.io/docs/add-ons/communication#home-assistant-core
export WEBSOCKET_URL="http://supervisor/core/websocket"
export ACCESS_TOKEN="${SUPERVISOR_TOKEN}"

python3 /usr/local/src/hassio-to-pubsub/main.py