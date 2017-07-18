#!/bin/bash

function echoerr {
    (>&2 echo $*)
}

INKSCAPE=$(which inkscape)
if [[ $INKSCAPE == "" ]]; then
    echoerr "Error: Unable to locate Inkscape executable."
    exit 1
fi

RE='^[0-9]+$'

for iconset in *; do
    if [[ -d $iconset ]]; then
        pushd $iconset >/dev/null
        ICONSETDIR=$(pwd)
        for src in *; do
            if [[ -d $src ]]; then
                SOURCEDIR=$(pwd)/$src
                for icon in $SOURCEDIR/*.svg; do
                    #echo $icon
                    if [[ $icon != "$SOURCEDIR/*.svg" ]]; then
                        pushd $ICONSETDIR >/dev/null
                        for size in *; do
                            if [[ -d $size ]] && [[ $size =~ $RE ]]; then
                                DESTDIR=$ICONSETDIR/$size/
                                ICONFILE=$(basename "$icon")
                                FILENAME="${ICONFILE%.*}"
                                DESTFILE=$DESTDIR$FILENAME.png
                                if [[ -e $DESTFILE ]] && [[ ! -L $DESTFILE ]]; then
                                    mv -f $DESTFILE $DESTDIR$FILENAME.bak.png
                                    $INKSCAPE -z -e $DESTFILE -w $size -h $size $icon
                                    echo $FILENAME: $size x $size
                                fi
                            fi
                        done
                        popd >/dev/null
                    fi
                done
                #svgcount=$(ls $src/*.svg -1 2>/dev/null | wc -l)
                #if [[ $svgcount != 0 ]]; then
                #    SOURCEDIR=$(pwd)/$src
                #    echo "** Processing $SOURCEDIR ($svgcount svg files)"
                #fi
            fi
        done
        # if [[ -d scalable ]]; then
        # else
        #     echoerr "Error, no scalable icons found in $iconset"
        # fi
        popd >/dev/null
    fi
done
