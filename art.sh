#!/bin/bash


export rootdir="/music"

tagfile () {
  echo Tagging $(basename "$2")
  ./tageditor-3.3.10-Build28.1.glibc2.17-x86_64.AppImage \
    -s cover="$1" --max-padding 100000 -f "$2"
}

tagalbum () {
  echo "Found $1"
  dir=$(dirname "$1")
  find "$dir" -name "*.m4a" -print0 | while read -d $'\0' file
  do
    tagfile "$1" "$file"
  done
}

find "$rootdir" -name "*.jpg" -print0 | while read -d $'\0' file
do
  tagalbum "$file"
done

exit
