#!/bin/bash

# Deletes merged granches
git branch --merged | egrep -v '(^\*|^  master[-/]*.*$|^  develop[-/]*.*$|^  release[-/]*.*$|^  development$)' | xargs git branch -d
