_DEBUG="on"

function DEBUG() {
  [ "$_DEBUG" == "on" ] && { PS4='$LINENO: '; $@; }
}


