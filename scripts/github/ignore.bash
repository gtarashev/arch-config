#!/bin/bash
# create a git ignore (mostly ignoring binary files)

# look for binary files, and put into .gitignore
find . -executable -type f | grep -Ev '.git\|*.*' | > .gitignore
