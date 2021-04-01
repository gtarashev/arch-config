#!/bin/bash
# run git add, git commit and git push together
git add -A && git commit -m "$1" && git push
