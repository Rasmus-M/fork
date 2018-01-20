rem disk image
IF EXIST skyway.dsk GOTO :dskok
xdm99.py 4kcompo.dsk --initialize DSSD -n 4KCOMPO
:dskok

rem object file
xas99.py -R -S -L 4kcompo.lst source/disk.a99

rem E/A#5 file
xas99.py -R -i -o 4kcompo source/disk.a99
xdm99.py 4kcompo.dsk -a 4kcompo -n 4KCOMPO

rem clean up disk
IF EXIST 4kcompo.bin_6000 (
del 4kcompo.bin_6000
)
IF EXIST 4kcompo.bin (
del 4kcompo.bin
)

rem cart
xas99.py -b -R -D cart -o 4kcompo.bin source/cart.a99
ren 4kcompo.bin_6000 4kcompo.bin

rem 32k cart
rem java -jar tools/ea5tocart.jar 4kcompo "4K COMPO" > make.log