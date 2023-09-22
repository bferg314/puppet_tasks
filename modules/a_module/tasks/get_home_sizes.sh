#!/bin/bash

# Get the size of all home directories
du -h --max-depth=0 ~ | sort -hr
