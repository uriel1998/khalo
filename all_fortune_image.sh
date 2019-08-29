#!/bin/bash


########################################################################
# Declarations
########################################################################
declare Fortune

TempDir=$(mktemp -d)

if [ -f "$1" ];then

    #fb: 1200x628
    #istory: 1080x920
    #iphoto: 1080x1080
    #twitter: 440x220
    #generic wide: 1024x512
    ################################################################################
    # Wherein things get told to happen
    ################################################################################
    main() {
        while read -r line;do
            bob=`wget https://source.unsplash.com/random/1024x512 -O $TempDir/unsplash.jpg`
            convert $TempDir/unsplash.jpg -blur 0x3 $TempDir/unsplash_blur.jpg
            if [[ "$line" =~ " -" ]];then
                Fortune=$(echo "$line" | sed 's/ -/\n-/g' )
            else
                Fortune=$(echo "$line")
            fi
            /usr/bin/convert -background none -fill white -stroke black -strokewidth 3 -gravity Center -font Interstate -size 800x512 \
                  caption:"$Fortune" \
                  $TempDir/TextImage.png

            if [ -f /usr/local/bin/slugify ];then
                filename=$(/usr/local/bin/slugify "$Fortune")
            else
                filename=$(cat /proc/sys/kernel/random/uuid)
            fi
            /usr/bin/composite -gravity center $TempDir/TextImage.png $TempDir/unsplash_blur.jpg "$HOME"/"$filename".jpg
                
                

            rm $TempDir/TextImage.png
            rm $TempDir/unsplash_blur.jpg
            rm $TempDir/unsplash.jpg
            sleep 10
        done < "$1"

        exit 0
    }

    main

fi
