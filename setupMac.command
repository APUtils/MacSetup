#!/bin/bash

base_dir=$(dirname "$0")
cd "$base_dir"

echo "Setuping Mac for development..."

echo "Setup keyboard..."
folder=~/Library/Keyboard\ Layouts/
mkdir -p "$folder"
cp -R "Keyboard Layouts/" "$folder"

echo "Setup templates..."
folder=~/Library/Developer/Xcode/Templates/Custom
mkdir -p "$folder"
rm -rf "$folder"
cp -R "Templates/Custom/" "$folder"

echo "Setup Xcode color schemes..."
folder=~/Library/Developer/Xcode/UserData/FontAndColorThemes/
mkdir -p "$folder"
cp -R "FontAndColorThemes/" "$folder"

echo "Setup Xcode snippets..."
folder=~/Library/Developer/Xcode/UserData/CodeSnippets/
mkdir -p "$folder"
rm -rf "$folder"
cp -R "CodeSnippets/" "$folder"

echo "Setup Xcode hotkeys..."
folder=~/Library/Developer/Xcode/UserData/KeyBindings/
mkdir -p "$folder"
rm -rf "$folder"
cp -R "KeyBindings/" "$folder"

# TODO: Terminal aliases
# TODO: Mac Hotkeys
