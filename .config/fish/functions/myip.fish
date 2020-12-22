# Defined in - @ line 1
function myip --wraps='curl ipinfo.io/ip' --description 'alias myip curl ipinfo.io/ip'
  curl ipinfo.io/ip $argv;
end
