#!/bin/bash

########################################################################
# Declarations
########################################################################
declare Fortune

TempDir=$(mktemp -d)

################################################################################
# Wherein things get told to happen
################################################################################
main() {
	bob=`wget https://source.unsplash.com/random/1024x512 -O $TempDir/unsplash.jpg`
	convert $TempDir/unsplash.jpg -blur 0x3 $TempDir/unsplash_blur.jpg
	Fortune=$(/usr/games/fortune)
	/usr/bin/convert -background none -fill white -stroke black -strokewidth 3 -gravity Center -font Interstate -size 800x512 \
          caption:"$Fortune" \
          $TempDir/TextImage.png

    /usr/bin/composite -gravity center $TempDir/TextImage.png $TempDir/unsplash_blur.jpg "$HOME"/quote.jpg
               

	exit 0
}

main

rm $TempDir/TextImage.png
rm $TempDir/unsplash_blur.jpg
rm $TempDir/unsplash.jpg
rmdir $TempDir

