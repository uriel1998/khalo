# khalo
A selfhosted way to create images with quotations

![Output example](https://raw.githubusercontent.com/uriel1998/khalo/master/output.jpg "Example output")

## Contents
 1. [About](#1-about)
 2. [License](#2-license)
 3. [Prerequisites](#3-prerequisites)
 4. [How to use](#4-how-to-use)
 5. [TODO](#5-todo)

***
 
## 1. About

These programs creates an image with text upon it from either a `fortune` file or a plain text file.  You can read the [blog post about it here.](https://ideatrash.net/?p=70844)

## 2. License

This project is licensed under the MIT license. For the full license, see `LICENSE`.

## 3. Prerequisites

### These may already be installed on your system.

 * `imagemagick` command-line tool for manipulating images. `imagemagick` can be found on major Linux distributions.
 * `wget` command-line tool for downloading files. `wget` can be found on major Linux distributions.

### Optional

 * `fortune` command-line tool for providing "fortunes". `fortune` can be found on major Linux distributions.
 * `slugify` if you wish to have filenames that mirror the text of the quotation. I used [slugify-cli](https://github.com/sindresorhus/slugify-cli), which is a node.js program. 

## 4. How to use

 * If you wish to use your fortune file and get one quotation a day, use `fortune_image.sh`.  As configured now, it will output one image to your `$HOME` directory.
 * If you wish to specify which fortune file to use, edit `Fortune=$(/usr/games/fortune)` to read `Fortune=$(/usr/games/fortune MyFortuneFile)`

 * If you wish to use a plain text file and output all of the quotations at once to your home directory, use `all_fortune_image.sh` with the text file as the first argument.
 * Note that you will have to edit the sizes on lines 23 and 30 to get different output sizes.

## 5. Todo

 * TBH, I'm probably not going to clean this up a lot more; there are too many variables possible for me to account for all of them.
