#!/bin/bash

# Get all running Java processes
if ! command -v ps >/dev/null; then
    echo "Error: 'ps' command not found."
    exit 1
fi

processes=$(ps -ef | grep java | grep -v grep)
if [ -z "$processes" ]; then
    echo "No Java processes found."
else
    echo "$processes"
fi
