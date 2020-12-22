# Defined in - @ line 1
function update --wraps='sudo pacman -Syyy && sudo pacman -Syu' --description 'alias update sudo pacman -Syyy && sudo pacman -Syu'
  sudo pacman -Syyy && sudo pacman -Syu $argv;
end
