# Wallamaker


Wallamaker will create thumbnails and a contact sheet of all of your wallpapers. It will also generate a nice looking `README` for easy sharing with the rest of us on GitHub. You can check out my wallpaper repository ![here](https://github.com/avcourt/wallpapers) for an idea of what the finished product looks like.

***Note**: This readme is stored in `docs/`as the generated readme will be created in the root directory when you run `wallamaker.sh` and is deleted by `cleanup.sh`.*

![Demo](../docs/demo.gif)

The initial structure should look something like this:

```bash
.
├── cleanup.sh
├── pic1.jpg
├── pic2.jpg
├── pic3.jpg
├── pic4.jpg
├── pic5.jpg
├── pic6.jpg
├── pic7.jpg
└── wallamaker.sh
```

After running `wallamaker.sh` the file structure would be as follows:

```bash
.
├── cleanup.sh
├── contact-sheet.jpg
├── hi_res
│   ├── pic1.jpg
│   ├── pic2.jpg
│   ├── pic3.jpg
│   ├── pic4.jpg
│   ├── pic5.jpg
│   ├── pic6.jpg
│   └── pic7.jpg
├── README.md
├── thumbs
│   ├── pic1.jpg
│   ├── pic2.jpg
│   ├── pic3.jpg
│   ├── pic4.jpg
│   ├── pic5.jpg
│   ├── pic6.jpg
│   └── pic7.jpg
└── wallamaker.sh
```

The `cleanup.sh` and `wallamaker.sh` scripts should be placed in a directory containing **only** wallpapers with `gif`, `jpeg` `jpg`, and `png` extensions. If you want support for other extensions, simply add them in `wallamaker.sh`.

The max resolution is currently hardcoded inside `wallamaker.sh` to 500px. If you have many wallpapers, the creation of the contact sheet may fail if the thumbnail resolution is too high. Experiment with different values.

Currently this only works on a flat file structure.
If you want to extend this script to respect sorted directories of wallpapers, go for it. PRs are welcomed.

If you wish to update your README and contact sheet with new wallpapers, just add them into the root wallamaker directory and run `wallamaker.sh` again. It will only generate thumbnails for the newly placed images. 

If you wish to delete a wallpaper, you should remove it from both `hi_res/` and `thumbs/` or it will still be included in the contact sheet.

## Dependencies
This script uses [ImageMagick](https://imagemagick.org/index.php).

#### Linux
Use your favorite package manager (aur, apt, yum, zipper, pacman, etc):  
`$ sudo apt install imagemagick`

#### MacOS
`$ brew install imagemagick`

## Run
Place `cleanup.sh` and `wallamaker.sh` in a flat directory containing your wallpapers. 

If you'd prefer, you can just clone this repo and place your own images in here instead:

`$ git clone https://github.com/avcourt/wallamaker.git` 

`$ cd wallamaker`

`$ rm *.jpg # remove the sample wallpapers ignore if you wanna keep em` 

`$ cp /your/wallpapers/* .`

`$ ./wallamaker.sh`

#### Cleanup
`$ ./cleanup`

This will restore the original flat structure containing only your wallpapers and the `cleanup.sh` and `wallamaker.sh` scripts.
