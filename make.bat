@rem disk image
IF EXIST fork.dsk GOTO :dskok
xdm99.py fork.dsk --initialize DSSD -n FORK
:dskok

@rem object file at >A000
xas99.py -R -S -L fork.lst -o fork.obj source/disk.a99

@rem E/A#5 file at >A000
xas99.py -R -i -o fork source/disk.a99
xdm99.py fork.dsk -a fork -n FORK

@rem 32k cart
java -jar tools/ea5tocart.jar fork "FORK" > make.log

@rem TI BASIC loader
xas99.py -R -L fork-bas.lst -o fork-bas.obj source/basic-loader.a99
xdm99.py fork.dsk -a fork-bas.obj -f DIS/FIX80 -n FORKBAS

@rem Super Cart E/A#5
xas99.py -R -i -D cart -o forksc source/cart-7000.a99
xdm99.py fork.dsk -a forksc -n FORKSC

@rem FG99 cart

@rem clean up
IF EXIST fork.bin_6000 (
del fork.bin_6000
)
IF EXIST fork.bin_7000 (
del fork.bin_7000
)
IF EXIST fork.bin_7000.lz4 (
del fork.bin_7000.lz4
)
IF EXIST fork-fg.bin (
del fork-fg.bin
)

xas99.py -b -R -D cart -o fork.bin source/cart-7000.a99
tools\lz4.exe fork.bin_7000

xas99.py -b -R -D cart -o fork.bin source/cart.a99
tools\pad.exe fork.bin_6000 fork-fg.bin 4096

del fork.bin_6000
del fork.bin_7000
del fork.bin_7000.lz4
