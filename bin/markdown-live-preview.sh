#!/bin/sh

## reload the browser window
function reload() {
  echo "reloading page"
  PAGE_TITLE="$1"
  CUR_WID=$(xdotool getactivewindow)

  ## gets the first $BROWSER window, if you have more than one
  ## $BROWSER window open, it might not refresh the right one,
  ## as an alternative you can search by the window/html title
  WID=$(xdotool search --name "$PAGE_TITLE - Profile 1 - Microsoft Edge" | head -1)
  echo "WID=$WID"
  xdotool windowactivate $WID
  xdotool key ctrl+r
  xdotool windowactivate $CUR_WID
}

## ----------------------------------------------------------------------------------------
## actual start of the script
MD_FILE="${1:-index.md}"
HTML_FILE="${MD_FILE%.*}.html"
BROWSER="microsoft-edge-stable"

echo "MD_FILE=$MD_FILE"
echo "HTML_FILE=$HTML_FILE"
echo "BROWSER=$BROWSER"

## build for first time
node ~/bin/markdown2html.js $MD_FILE

## get the title of the html file
PAGE_TITLE=$(grep title ${HTML_FILE} | head -n 1 | sed 's/<[^>]*>//g' | sed -e 's/^[ \t]*//')

echo "PAGE_TITLE=$PAGE_TITLE"

## open the html file in the browser
$BROWSER $HTML_FILE &

echo "waiting for changes in $MD_FILE"

sleep 5

## watch for changes in the markdown file
(
echo $MD_FILE | entr -s node ~/bin/markdown2html.js $MD_FILE
reload "$PAGE_TITLE"
)