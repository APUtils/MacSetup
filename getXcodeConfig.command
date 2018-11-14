#!/bin/bash

base_dir=$(dirname "$0")
cd "$base_dir"

echo "Getting current Xcode config..."

echo "Getting templates..."
templates_folder=~/Library/Developer/Xcode/Templates/Custom
rm -rf "Templates/Custom/"
cp -R "$templates_folder" "Templates/Custom/"

echo "Getting Xcode color scheme..."
xcode_themes_folder=~/Library/Developer/Xcode/UserData/FontAndColorThemes/
cp -R "$xcode_themes_folder" "FontAndColorThemes/"

# TODO: Xcode aliases
# TODO: Terminal aliases
# TODO: Hotkeys
