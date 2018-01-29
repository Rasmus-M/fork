@rem disk image
IF EXIST 4kcompo.dsk GOTO :dskok
xdm99.py 4kcompo.dsk --initialize DSSD -n 4KCOMPO
:dskok

@rem object file
xas99.py -R -S -L 4kcompo.lst -o 4kcompo.obj source/disk.a99

@rem E/A#5 file at >A000
xas99.py -R -i -o 4kcompo source/disk.a99
xdm99.py 4kcompo.dsk -a 4kcompo -n 4KCOMPO

@rem object file at >7118
xas99.py -R -D MINIMEM -L 4kcompomm.lst -o 4kcompomm.obj source/minimem.a99
xdm99.py 4kcompo.dsk -a 4kcompomm.obj -n 4KCOMPOMM

@rem clean up
IF EXIST 4kcompo.bin_6000 (
del 4kcompo.bin_6000
)
IF EXIST 4kcompo.bin (
del 4kcompo.bin
)

@rem cart
xas99.py -b -R -D cart -o 4kcompo.bin source/cart.a99
ren 4kcompo.bin_6000 4kcompo.bin

@rem 32k cart
java -jar tools/ea5tocart.jar 4kcompo "4K COMPO" > make.log