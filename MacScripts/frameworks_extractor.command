#!/bin/bash

# Extracts frameworks from a specified project and appends to existing list in 'frameworks.txt'

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

frameworks_file="frameworks.txt"
touch "$frameworks_file"

echo ""

project_path=$1
if [ -z "$project_path" ]; then
    read -p "Specify project path: " project_path
fi

if [ -z "$project_path" ]; then
    cat "$frameworks_file" | tr '\n' ',' | sed 's/,/, /g'
    exit 1
fi

swift_project_frameworks=$(grep -rHn --exclude-dir=Carthage --exclude-dir=swagger-codegen --exclude-dir=.git --exclude-dir=pod-template --exclude-dir=Pods --include \*.swift "^import [a-z_A-Z]*$" "$project_path" | cut -d":" -f3 | sort | uniq | sed -e "s/import //g")

objc_project_frameworks=$(grep -rHn --exclude-dir=Carthage --exclude-dir=swagger-codegen --exclude-dir=.git --exclude-dir=pod-template --exclude-dir=Pods --include \*.h --include \*.m "^#import [<].*[>]$" "$project_path" | cut -d":" -f3 | sort | uniq | sed -e "s/#import <//g" | sed -e "s/\/.*//g")

project_frameworks=$(printf "$swift_project_frameworks\n$objc_project_frameworks" | sort -u -f)

echo "$project_frameworks"

echo ""
echo "Project frameworks:"
echo "$project_frameworks" | tr '\n' ',' | sed 's/,/, /g'

echo "$project_frameworks" >> "$frameworks_file"
new_frameworks=$(cat "$frameworks_file" | sort -u -f)

echo "$new_frameworks" > "$frameworks_file"

echo ""
echo "Combined list:"
cat "$frameworks_file" | tr '\n' ',' | sed 's/,/, /g'

echo ""
