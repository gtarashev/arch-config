# Moved to (config)[https://github.com/gtarashev/config]


# Arch Config
This repo used to be my Arch Linux config which included some dot files and other scripts that I use more regularly.

## Sections
#### dotfiles
Self-explanatory; it includes my dotfiles for zsh, nvim and a simple bashrc (note no . because it's just a template).

#### scripts
The scripts folder contains mostly shell scripts, it includes:
* auto-install: a WIP script for auto-installing my arch setup. I no longer use Arch so I haven't worked on it for a long time, however, I want to make it work and make it distro agnostic when I have time.
* emojiSelector: a nearly finished script which uses dmenu to show emojis then copies them to the clipboard, I just need to figure out the font
* small: contains some single file scripts, some of which are too large for a single line and I don't want them in my .zshrc:
  * dmenumanselect: use dmenu to get the manual of a command, convert it to a pdf and open it with zathura
  * minecraft-server: a bash script which creates a minecraft server with the given arguments
  * wpaper: simple script to change the current wallpaper (using xwallpaper) then create a sym link of a specific file to that wallpaper so I can make sure that I use the same wallpaper on restart
  * bar.bash: the most important script, distro agnostic "bar" for dwm which just changes xsetroot to add network traffic, battery %, date and time
