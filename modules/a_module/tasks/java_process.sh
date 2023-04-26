#!/bin/bash

if [[ -z "$PT_action" ]]; then
    echo "Error: action parameter not provided."
    exit 1
fi

if [[ "$PT_action" == "get" ]]; then
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
elif [[ "$PT_action" == "kill" ]]; then
    if [[ -z "$PT_process_name" ]]; then
        echo "Error: process_name parameter not provided."
        exit 1
    fi

    if ! pgrep -f "$PT_process_name" >/dev/null; then
        echo "Error: process '$PT_process_name' not found."
        exit 1
    fi

    if pkill -f "$PT_process_name" >/dev/null; then
        echo "Process '$PT_process_name' killed successfully."
    else
        echo "Error: failed to kill process '$PT_process_name'."
        exit 1
    fi
else
    echo "Error: invalid action parameter '$PT_action'. Must be 'get' or 'kill'."
    exit 1
fi
