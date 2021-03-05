#!/bin/bash
sudo pacman -Rdds "$(pacman -Qdt | cut -d " " -f 1)"
