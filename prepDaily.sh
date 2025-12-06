#!/bin/bash

# This script was created by newScript.sh
# It processes a list of scripture passages from a given file.

# Check for scripture plan file argument
if [ -z "$1" ]; then
    echo "Usage: $0 <scripture_plan_file>"
    exit 1
fi

SCRIPTURE_PLAN_FILE="$1"

if [ ! -f "$SCRIPTURE_PLAN_FILE" ]; then
    echo "Error: Scripture plan file not found: $SCRIPTURE_PLAN_FILE"
    exit 1
fi

source venv/bin/activate
source "$SCRIPTURE_PLAN_FILE"

for daily in "${scripture[@]}"; do
	echo "--- Processing: $daily ---"

	echo "Adding '$daily' to dbs-initiator..."
	if ! dbs-initiator plan add "$daily"; then
		echo "Error: 'dbs-initiator' failed for '$daily'. Aborting." >&2
		exit 1
	fi

	echo "Creating OBS scene for '$daily'..."
	if ! obs-scene-transporter import Daily-Template.zip -n "$daily"; then
		echo "Error: 'obs-scene-transporter' failed for '$daily'. Aborting." >&2
		exit 1
	fi
done

echo "--- All scriptures processed successfully! ---"
