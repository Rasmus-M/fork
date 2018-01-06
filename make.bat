IF EXIST skyway.dsk GOTO :dskok
xdm99.py 4kcompo.dsk --initialize DSSD -n 4KCOMPO
:dskok

xas99.py -R -L 4kcompo.lst source/4kcompo.a99

xas99.py -R -i source/4kcompo.a99 -o 4kcompo

xdm99.py 4kcompo.dsk -a 4kcompo -n 4KCOMPO

java -jar tools/ea5tocart.jar 4kcompo "4K COMPO" > make.log