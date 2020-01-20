#!/bin/bash

# Deletes merged granches
git branch --merged | egrep -v "(^\*|^  develop$|MUI-3256|^  release/)" | xargs git branch -d
