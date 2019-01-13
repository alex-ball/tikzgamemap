# tikzgamemap: Maps for interactive fiction with TikZ

While interactive fiction can come in many different varieties, there is a class
of works that follows the tradition established by *[Colossal Cave]
Adventure* and Infocom games such as *Zork*. Players typically move between
areas or rooms using the eight cardinal and primary intercardinal points of the
compass, as well as up, down, in and out. This package provides some shortcut
methods for mapping out such game spaces using the graph-drawing facilities of
TikZ.

## Installation

### Dependencies

To compile the documentation you will need to have the
[minted](http://ctan.org/pkg/minted) package working, which in turn relies on
Python 2.6+ and Pygments. See the documentation of that package for details.

Note that the zip file on the
[Releases](https://github.com/alex-ball/tikzgamemap/releases) page on GitHub
contains all the files you need, pre-compiled.

### Automated way

Running "make" generates the derived files tgm1.pdf and tgm1.sty.
Running "make inst" installs the files in the user's TeX tree.
Running "make install" installs the files in the local TeX tree.


A makefile is provided which you can use with the Make utility:

  * Running `make source` just generates the package file.
  * Running `make` generates the class file and documentation.
  * Running `make inst` generates and installs the files to your home TeX tree.
    (To undo, run `make uninst`.)
  * Running `make install` generates and installs the files to the local TeX
    tree. (To undo, run `make uninstall`.)
  * Running `make clean` removes auxiliary files from the working directory.
  * Running `make distclean` removes the generated from the working directory
    files as well.

### Manual way

To install the class from scratch, follow these instructions. If you have
downloaded the zip file from the [Releases] page on GitHub, you can skip the
first two steps.

 1. Run `tex tikzgamemap.dtx` to generate the package file. (You can safely skip
    this step if you are confident about step 2.)

 2. Compile `tikzgamemap.dtx` with your favourite version of LaTeX with shell
    escape enabled (as required by `minted` for typesetting the listings). You
    will also need to run it through `makeindex`. This will generate the main
    documentation (DVI or PDF).

 3. To install the files, create the following folders in your chosen TeX tree
    and copy the files across as shown (read `.pdf` as `.dvi` if that is what
    you generated):
      - `source/latex/tikzgamemap`:
        `tikzgamemap.dtx`
        (`tikzgamemap.ins`)
      - `tex/latex/tikzgamemap`:
        `tgm1.sty`
      - `doc/latex/tikzgamemap`:
        `tikzgamemap.pdf`

 4. You may then have to update your installation's file name database
    before TeX and friends can see the files.

## Licence

This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License (LPPL), either
version 1.3c of this license or (at your option) any later
version.  The latest version of this license is in the file:

http://www.latex-project.org/lppl.txt

This work is "maintained" (as per LPPL maintenance status) by
Alex Ball.

This work consists of the files tikzgamemap.dtx, README.md and a Makefile.
