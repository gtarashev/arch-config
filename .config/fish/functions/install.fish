# Defined in - @ line 1
function install --wraps='sudo pacman -Sy' --description 'alias install sudo pacman -Sy'
  sudo pacman -Sy $argv;
end
