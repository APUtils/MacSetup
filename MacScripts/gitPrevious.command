#!/bin/bash

# Checkouts previous commit
git log --pretty=oneline -1 --first-parent --skip=1 | cut -d' ' -f1 | xargs git checkout
