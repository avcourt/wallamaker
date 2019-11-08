#!/bin/bash

echo "Checking directory structure."
if [ -d hi_res ] && [ -d thumbs ]; then
    echo "it looks like you have run wallamaker.sh before."
    echo "Ignoring images already in hi_res/"
    echo "New photos should be placed in project root."
    rm -v contact-sheet.jpg
    echo "Updating thumbnails with new images..."
    echo "Generating new thumbnails with max dimension 500 pixels"
    mogrify -format jpg -path thumbs -thumbnail 500x500 *.{gif,jpeg,jpg,png} 2>/dev/null
    mv -v *.{gif,jpeg,jpg,png} hi_res 2>/dev/null
else
    echo "Creating hi_res/ and /thumb/ directories"
    mkdir hi_res thumbs
    mv *.{gif,jpeg,jpg,png} hi_res 2>/dev/null
    echo "Generating thumbnails with max dimension 500 pixels"
    mogrify -format jpg -path thumbs -thumbnail 500x500 hi_res/*
fi

echo "Generating contact sheet"
montage thumbs/* contact-sheet.jpg

echo "Generating README"
echo "![contact sheet](contact-sheet.jpg)" >> README.md
for image in hi_res/*
do
    echo "### $image}" >> README.md
    echo "![$image]($image)" >> README.md
    echo "***" >> README.md
done
