# This file is sourced at the end of zshrc

## enlimitlate duplicate entries in PATH
PATH=$(echo "$PATH" | tr ':' '\n' | sort -u | tr '\n' ':')

## declare variable for holding path content
P=

## sort paths in order of /run /usr /opt /var /home
for l in "run" "usr" "opt" "var" "home"; do
  for p in $(echo $PATH | tr ':' ' ' | sort); do
    [[ "$p" == /$l/* && -d "$p" ]] && P="$P:$p"
  done
done

## remove leading colon
export PATH="${P:1}"

## Run neofetch
fastfetch
