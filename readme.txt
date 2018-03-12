*********************************************************************
*
* Fork - 4K Compo
* For the TI-99/4A home computer
*
* January - March 2017
* Rasmus Moustgaard <rasmus.moustgaard@gmail.com>
*
*********************************************************************

Requirements:

This game is using 4 KiB CPU RAM. To run it, the following is required:

* A TI-99/4A with either FinalGROM 99, Mini Memory, Super Cart or 32K RAM expansion.
* A cassette recorder or disk system is required to load the game into Mini Memory, Super Cart or 32K.
* A joystick is required to control the game. Keyboard is not supported.

*** If you run this game in an emulator that allows more than 4 sprites on a line to be displayed, please turn this off
since the game relies on the 4 sprite limitation to keep the bottom lines of the screen clear of sprites. If you use an
F18A that by default allows 32 sprites per line, the game will change this temporarily to allow only 4 sprites per line.

TI files:

DSK1.FORKSC    Super Cart E/A#5 file
DSK1.FORKTB    TI BASIC loader for Mini Memory or Super Cart
DSK1.FORK      E/A#5 file for 32K RAM expansion

PC files:

fork-fg99.bin  Cartridge image for FinalGROM 99 (no 32K RAM required)
fork8.bin      ROM -> RAM cartridge image for 32K RAM expansion
fork.rpk       Same as above in MAME rpk format
fork.wav       TI BASIC cassette tape audio file for Mini Memory or Super Cart

Instructions:

You are in charge of 'FORK', a 4K tri-fighter on a deathly mission to penetrate enemy territory and steal their most valued bonus stars.
Fortunately your fighter is equipped with an advanced GPS (Get Position of Star) that allows you to know the location of each star,
and a blob gun to help keeping those enemies out of your path.

* Use joystick 1 to control your fighter.

* Steer your tri-fighter to the location indicated by the GPS, and pick up the star to advance to the next level.

* The faster you complete a level, the more points you will earn.

* Avoid the square mines, or shoot them for extra points.

* Crashing into the buffer balls will make your fighter bounce off in the opposite direction. This will earn you a few points.

* As you reach higher levels, the stars will be harder to find, and more mines will appear.

* Extra lives can be picked up from time to time.

* If time runs out you lose a life, and the level is restarted. If all lives are lost the game ends.

Technical:

* This game was programmed in TMS9900 assembly language using the XAS99 assembler and the IntelliJ IDEA editor plugin.

* The graphics was created using the Magellan map/graphics editor.

* The scrolling background takes up only 108 bytes of CPU RAM, which is expanded to more than 8 KiB of video RAM.

* The game loads its character set from GROM, but is not dependent on other routines or data in the TI-99/4A ROMs or GROMs.

* Tursi's lz4 decompression routine was used to create the FinalGROM 99 image.

* The TI BASIC loader was created using Senior_falson's SNSLOADER.

* The source code is available from GitHub (https://github.com/Rasmus-M/fork).
