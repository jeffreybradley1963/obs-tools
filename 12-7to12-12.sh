#!/bin/bash

# This script was created by newScript.sh
# Add your script logic here
source venv/bin/activate

scripture=("1 Samuel 28:1-2" "1 Samuel 28:3-6" "1 Samuel 28:7-10" "1 Samuel 28:11-19" "1 Samuel 28:20-25" "1 Samuel 29:1-5")

for daily in "${scripture[@]}"; do
	obs-scene-transporter import Daily-Template.zip -n "$daily"
	echo $daily
done
