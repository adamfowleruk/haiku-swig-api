#!/bin/bash
H=/home/system/develop/headers/os
SYSINCLUDES=-I/boot/system/develop/headers/be -I/boot/system/develop/headers/cpp -I/boot/system/develop/headers/posix 
L=/boot/system/lib
P=/boot/system/develop/headers/python2.7
mkdir -p generated/swig-python
cd generated/swig-python

echo "---------------------------------"
echo "Creating Haiku Python C++ wrapper"
echo "---------------------------------"
swig -c++ -python -I$H -I$P -outcurrentdir -v -macroerrors ../../swig/haiku-swig-python.i 


echo "----------------------------------"
echo "Compiling Haiku Python C++ wrapper"
echo "----------------------------------"
g++ $SYSINCLUDES -c -std=c++11 -fPIC -fpermissive  -I$H/app -I$H/support -I$P haiku-swig-python_wrap.cxx  -o haiku-swig-python_wrap.o



echo "----------------------------------"
echo "Linking Haiku Python C++ wrapper"
echo "----------------------------------"
g++ -shared -o _haiku.so haiku-swig-python_wrap.o -L$L -lbe `pkg-config --cflags --libs python`

echo "----------------------------------"
echo "Done."
echo "----------------------------------"
