#!/bin/bash

base_dir=$(dirname "$0")
cd "$base_dir"

echo "Setuping Mac for development..."

echo "Setup keyboard..."
keyboard_folder=~/Library/Keyboard\ Layouts/
cp -R "Keyboard Layouts/" "$keyboard_folder"

echo "Setup templates..."
templates_folder=~/Library/Developer/Xcode/Templates/Custom
rm -rf "$templates_folder"
cp -R "Templates/Custom/" "$templates_folder"

echo "Setup Xcode color scheme"
xcode_themes_folder=~/Library/Developer/Xcode/UserData/FontAndColorThemes/
cp -R "FontAndColorThemes/" "$xcode_themes_folder"
