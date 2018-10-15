#!/bin/bash

base_dir=$(dirname "$0")
cd "$base_dir"

echo "Setuping Mac for development..."

echo "Setup keyboard..."
cp -R "Keyboard Layouts/" ~/Library/Keyboard\ Layouts/

#echo "Setup templates..."
#cp "Templates/"* "~/Library/Developer/Xcode/Templates/"
