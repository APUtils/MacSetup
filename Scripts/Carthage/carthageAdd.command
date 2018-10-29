#!/bin/bash

### Script to add new framework to a project ###

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
cd ..
cd ..

github_framework=$1
git_mark=$2

# TODO: Handle errors and restore Cartfile

# Check if there are uncommited changes
if [[ -n $(git status -s) ]]; then
    printf >&2 "\n${red_color}Please commit your changes first${no_color}\n\n"
    exit 1
fi

# Requires `xcodeproj` installed - https://github.com/CocoaPods/Xcodeproj
# sudo gem install xcodeproj
hash xcodeproj 2>/dev/null || { printf >&2 "\n${red_color}Requires xcodeproj installed - 'sudo gem install xcodeproj'${no_color}\n\n"; exit 1; }

echo ""

if [ -z $github_framework ]; then
    # Asking which one to add
    read -p "Specify github framework (e.g. APUtils/KeyboardAvoidingView): " github_framework
fi

if [ -z $git_mark ]; then
    # Asking additional info
    read -p "Specify branch (e.g. master) or tag (e.g. 1.0.0) or commit (e.g. b5f823918f7cfaf6208bd6a04b7a6b724992ff5d) or leave empty: " git_mark
fi

echo ""

framework_name="$(echo $github_framework | cut -s -d/ -f2)"

if [ ! -z $framework_name ]; then
    # Add new framework entry
    # TODO: Need to handle case when there is no separator
    script_separator="### SCRIPT SEPARATOR DO NOT EDIT ###"
    line_to_add="github \"$github_framework\""
    if [ ! -z $git_mark ]; then
        line_to_add="$line_to_add \"$git_mark\""
    fi
    sed -i '' "s|$script_separator|$line_to_add"'\
'"$script_separator|" Cartfile

    # Sorting list
    separator_line=$(grep -n "$script_separator" Cartfile | cut -d: -f1)
    (head -n $(expr $separator_line - 1) | sort -fu) < Cartfile 1<> Cartfile

    # Clone and build
    bash Scripts/Carthage/carthageUpdate.command $framework_name

    # Update project
    # TODO: Framework name might differ from github name. Need to check checkouted project and get scheme name from that in future
    # TODO: Framework might have other framework as dependency
    ruby Scripts/Carthage/carthageAdd.rb $framework_name

    # Commit all changes
    echo "Commiting..."
    git add -A && git commit -m "Added $github_framework framework" > /dev/null

    printf >&2 "\n${bold_text}SUCCESSFULLY ADDED FRAMEWORK${normal_text}\n\n"
else
    printf >&2 "\n${red_color}Invalid framework name${no_color}\n\n"
    exit 1
fi
