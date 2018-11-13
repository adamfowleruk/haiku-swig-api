#!/bin/bash
H=/home/system/develop/headers/os
L=/home/system/lib
P=/boot/system/develop/headers/python2.7
PLIB=/boot/system/lib/libpython2.7.so.1.0
HLIBS=-L/boot/system/lib/libbe.so
mkdir -p generated/swig-python
cd generated/swig-python

echo "---------------------------------"
echo "Creating Haiku Python C++ wrapper"
echo "---------------------------------"
swig -c++ -python -I$H -I$P -outcurrentdir -v -macroerrors ../../swig/haiku-swig-python.i 


echo "----------------------------------"
echo "Compiling Haiku Python C++ wrapper"
echo "----------------------------------"
g++ haiku-swig-python_wrap.cxx -c -std=c++11 -fpermissive  -U$H/app -I$H/support -I$P -L$PLIB $HLIBS
#g++ -shared -L$L/libbe.so -L$PLIB haikuswigpython_wrap,so

echo "----------------------------------"
echo "Done."
echo "----------------------------------"
