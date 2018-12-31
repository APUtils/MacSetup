#!/bin/bash

# Build to setup project's scripts

# Colors Constants
red_color='\033[0;31m'
green_color='\033[0;32m'
blue_color='\033[0;34m'
no_color='\033[0m'

# Font Constants
bold_text=$(tput bold)
normal_text=$(tput sgr0)

# Any subsequent(*) commands which fail will cause the shell script to exit immediately
set -e

base_dir=$(dirname "$0")
cd "$base_dir"

echo ""
project_path=$1
if [ -z "$project_path" ]; then
    read -p "Specify project path: " project_path
fi
if [ -z "$project_path" ]; then
    printf >&2 "\n${red_color}Invalid project path${no_color}\n\n"
    exit 1
fi

echo "Updating project scripts..."
cp -R "Scripts" "$project_path"

printf >&2 "\n${bold_text}SUCCESSFULLY UPDATED SCRIPTS${normal_text}\n\n"
