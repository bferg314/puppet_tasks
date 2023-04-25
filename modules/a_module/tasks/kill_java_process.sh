#!/bin/bash

# Kill the specified Java process
if [[ -z "$PT_process_name" ]]; then
  echo "Error: process_name parameter not provided."
  exit 1
fi

if pgrep -f "$PT_process_name" > /dev/null; then
  pkill -f "$PT_process_name"
  echo "Process '$PT_process_name' killed successfully."
  exit 0
else
  echo "Error: process '$PT_process_name' not found."
  exit 1
fi
