#!/bin/bash

query="{query}"

# Function to safely encode JSON strings
json_safe() {
  echo "$1" | jq -Rs .
}

# Base64 Decode
base64_decoded=$(echo -n "$query" | base64 --decode 2>/dev/null)
base64_safe=$(json_safe "$base64_decoded")

# URL Decode
url_decoded=$(python3 -c "import sys, urllib.parse; print(urllib.parse.unquote(sys.stdin.read().strip()))" <<< "$query")
url_safe=$(json_safe "$url_decoded")

# JSON Unescape
json_decoded=$(echo -n "$query" | jq -r 2>/dev/null)
json_safe_decoded=$(json_safe "$json_decoded")

# Hex Decode
hex_decoded=$(echo -n "$query" | xxd -r -p 2>/dev/null)
hex_safe=$(json_safe "$hex_decoded")

# HTML Entity Decode
html_decoded=$(python3 -c "import sys, html; print(html.unescape(sys.stdin.read().strip()))" <<< "$query")
html_safe=$(json_safe "$html_decoded")

# JWT Payload Extraction
jwt_payload=""
jwt_safe=""
if [[ "$query" =~ ^[A-Za-z0-9_-]+\.([A-Za-z0-9_-]+)\.[A-Za-z0-9_-]+$ ]]; then
  jwt_payload=$(echo "$query" | awk -F'.' '{print $2}' | base64 --decode 2>/dev/null | jq '.' 2>/dev/null)
  jwt_safe=$(json_safe "$jwt_payload")
fi

# Construct Alfred JSON response
echo '{
  "items": [
    {
      "title": '"$base64_safe"',
      "subtitle": "Base64 Decoded",
      "arg": '"$base64_safe"'
    },
    {
      "title": '"$url_safe"',
      "subtitle": "URL Decoded",
      "arg": '"$url_safe"'
    },
    {
      "title": '"$json_safe_decoded"',
      "subtitle": "JSON Unescaped",
      "arg": '"$json_safe_decoded"'
    },
    {
      "title": '"$hex_safe"',
      "subtitle": "Hex Decoded",
      "arg": '"$hex_safe"'
    },
    {
      "title": '"$html_safe"',
      "subtitle": "HTML Entity Decoded",
      "arg": '"$html_safe"'
    }' > /tmp/alfred_output.json

# Add JWT payload if available
if [[ ! -z "$jwt_payload" ]]; then
  echo ',{
      "title": '"$jwt_safe"',
      "subtitle": "JWT Payload Extracted",
      "arg": '"$jwt_safe"'
  }' >> /tmp/alfred_output.json
fi

# Close JSON array
echo '  ]
}' >> /tmp/alfred_output.json

# Output final Alfred response
cat /tmp/alfred_output.json

