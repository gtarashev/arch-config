# Defined in - @ line 1
function manmenu --wraps=man\ -k\ .\ \|\ dmenu\ -l\ \ 30\ \|\ awk\ \'\{print\ \}\'\ \|\ xargs\ -r\ man\ -Tpdf\ \|\ zathura\ - --description alias\ manmenu\ man\ -k\ .\ \|\ dmenu\ -l\ \ 30\ \|\ awk\ \'\{print\ \}\'\ \|\ xargs\ -r\ man\ -Tpdf\ \|\ zathura\ -
  man -k . | dmenu -l  30 | awk '{print }' | xargs -r man -Tpdf | zathura - $argv;
end
