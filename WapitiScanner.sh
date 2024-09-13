#!/bin/bash

# File containing the list of domains
DOMAIN_FILE="domains.txt"

# Customizable scan options
SCOPE="domain"             # Scan scope: 'page', 'folder', or 'domain'
MODULES="xss,sql"          # Modules to scan: e.g., 'xss,sql,exec'
TIME_LIMIT=300             # Max scan time per domain in seconds
OUTPUT_FORMAT="html"       # Report format: 'html', 'json', 'xml', 'txt'
OUTPUT_DIR="wapiti_reports" # Directory for storing reports

# Check if domain file exists
if [ ! -f "$DOMAIN_FILE" ]; then
  echo "Error: Domain file '$DOMAIN_FILE' not found!"
  exit 1
fi

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Function to scan a domain
scan_domain() {
  local domain="$1"
  local report_file="${OUTPUT_DIR}/$(echo "$domain" | sed 's/[^a-zA-Z0-9]/_/g').$OUTPUT_FORMAT"

  echo "Scanning $domain..."
  wapiti -u "$domain" \
    --scope "$SCOPE" \
    --module "$MODULES" \
    --max-scan-time "$TIME_LIMIT" \
    -f "$OUTPUT_FORMAT" \
    -o "$report_file"

  echo "Report saved to $report_file"
}

# Loop through each domain in the file and scan it
while IFS= read -r domain; do
  if [[ ! -z "$domain" ]]; then
    scan_domain "$domain"
  fi
done < "$DOMAIN_FILE"

echo "All scans completed."
