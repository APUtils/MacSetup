#!/bin/bash

# Deletes merged granches
git branch --merged | egrep -v '(^\*|^  develop$|^  release-to-develop$|^  release/|^  development$)' | xargs git branch -d
