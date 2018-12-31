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

echo "Getting Xcode snippets..."
xcode_themes_folder=~/Library/Developer/Xcode/UserData/CodeSnippets/
cp -R "$xcode_themes_folder" "CodeSnippets/"

echo "Getting Xcode hotkeys..."
xcode_themes_folder=~/Library/Developer/Xcode/UserData/KeyBindings/
cp -R "$xcode_themes_folder" "KeyBindings/"

# TODO: Terminal aliases
# TODO: Mac Hotkeys
