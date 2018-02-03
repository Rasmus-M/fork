@rem disk image
IF EXIST fork.dsk GOTO :dskok
xdm99.py fork.dsk --initialize DSSD -n FORK
:dskok

@rem object file
xas99.py -R -S -L fork.lst -o fork.obj source/disk.a99

@rem E/A#5 file at >A000
xas99.py -R -i -o fork source/disk.a99
xdm99.py fork.dsk -a fork -n FORK

@rem object file at >7118
@rem xas99.py -R -D MINIMEM -L forkmm.lst -o forkmm.obj source/minimem.a99
@rem xdm99.py fork.dsk -a forkmm.obj -n FORKMM

@rem clean up
IF EXIST fork.bin_6000 (
del fork.bin_6000
)
IF EXIST fork.bin (
del fork.bin
)

@rem cart
xas99.py -b -R -D cart -o fork.bin source/cart.a99
ren fork.bin_6000 fork.bin

@rem 32k cart
java -jar tools/ea5tocart.jar fork "FORK" > make.log

rem TI BASIC loader
xas99.py -R -L fork-bas.lst -o fork-bas.obj source/basic-loader.a99
xdm99.py fork.dsk -a fork-bas.obj -f DIS/FIX80 -n FORKBAS
