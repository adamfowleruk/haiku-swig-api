#!/bin/bash
H=/home/system/develop/headers/os
L=/home/system/lib
R=/boot/system/develop/headers/ruby-2.2.0
RCONFIG=/boot/system/develop/headers/ruby-2.2.0/x86_64-haiku
RLIB=/boot/system/lib/libruby.so.2.2
HLIBS=-L/boot/system/lib/libbe.so
mkdir -p generated/swig-ruby
cd generated/swig-ruby

echo "---------------------------------"
echo "Creating Haiku Ruby C++ wrapper"
echo "---------------------------------"
swig -c++ -ruby -I$H -I$R -I$RCONFIG -outcurrentdir -v -macroerrors ../../swig/haiku-swig-ruby.i 


echo "----------------------------------"
echo "Compiling Haiku Ruby C++ wrapper"
echo "----------------------------------"
g++ haiku-swig-ruby_wrap.cxx -c -std=c++11 -fpermissive  -U$H/app -I$H/support -I$R -I$RCONFIG -L$RLIB $HLIBS
#g++ -shared -L$L/libbe.so -L$PLIB haikuswigpython_wrap,so

echo "----------------------------------"
echo "Done."
echo "----------------------------------"
