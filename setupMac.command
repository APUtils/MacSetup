#!/bin/bash

# Colors Constants
red_color='\033[0;31m'
green_color='\033[0;32m'
blue_color='\033[0;34m'
no_color='\033[0m'

idun=$(id -un)
if [ "${idun}" != "antonplebanovich" ] && [ "${idun}" != "anton.plebanovich" ]; then
    printf >&2 "\n${red_color}This script may replace your custom Xcode templates, snippets and key bindings. Please use it only if you know what you are doing. You should edit script to remove this warning.${no_color}\n\n"
    exit 1
fi

base_dir=$(dirname "$0")
cd "$base_dir"

echo
echo "Setuping Mac for development..."

echo "Setup keyboard..."
folder=~/Library/Keyboard\ Layouts/
mkdir -p "$folder"
cp -R "Keyboard Layouts/" "$folder"

echo "Setup templates..."
folder=~/Library/Developer/Xcode/Templates/Custom
mkdir -p "$folder"
for directory in Templates/Custom/*/ ; do
	directory_name=$(basename "${directory}")
	rm -rf "${folder}/${directory_name}"
	cp -R "${directory}" "${folder}/${directory_name}"
done

echo "Setup Xcode color schemes..."
folder=~/Library/Developer/Xcode/UserData/FontAndColorThemes/
mkdir -p "$folder"
cp -R "FontAndColorThemes/" "$folder"

echo "Setup Xcode snippets..."
folder=~/Library/Developer/Xcode/UserData/CodeSnippets/
mkdir -p "$folder"
cp -R "CodeSnippets/" "$folder"

echo "Setup Xcode hotkeys..."
folder=~/Library/Developer/Xcode/UserData/KeyBindings/
mkdir -p "$folder"
cp -R "KeyBindings/" "$folder"

# TODO: Terminal aliases
# TODO: Mac Hotkeys

echo
