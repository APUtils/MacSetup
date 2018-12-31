#!/bin/bash

base_dir=$(dirname "$0")
cd "$base_dir"

echo "Setuping Mac for development..."

echo "Setup keyboard..."
folder=~/Library/Keyboard\ Layouts/
cp -R "Keyboard Layouts/" "$folder"

echo "Setup templates..."
folder=~/Library/Developer/Xcode/Templates/Custom
rm -rf "$folder"
cp -R "Templates/Custom/" "$folder"

echo "Setup Xcode color schemes..."
folder=~/Library/Developer/Xcode/UserData/FontAndColorThemes/
cp -R "FontAndColorThemes/" "$folder"

echo "Setup Xcode snippets..."
folder=~/Library/Developer/Xcode/UserData/CodeSnippets/
rm -rf "$folder"
cp -R "CodeSnippets/" "$folder"

echo "Setup Xcode hotkeys..."
folder=~/Library/Developer/Xcode/UserData/KeyBindings/
rm -rf "$folder"
cp -R "KeyBindings/" "$folder"

# TODO: Terminal aliases
# TODO: Mac Hotkeys
