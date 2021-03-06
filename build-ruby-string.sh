#!/bin/bash
H=/home/system/develop/headers/os
SYSINCLUDES=-I/boot/system/develop/headers/be -I/boot/system/develop/headers/cpp -I/boot/system/develop/headers/posix 
L=/boot/system/lib
R=/boot/system/develop/headers/ruby-2.2.0
RCONFIG=/boot/system/develop/headers/ruby-2.2.0/x86_64-haiku
mkdir -p generated/swig-ruby
cd generated/swig-ruby

echo "---------------------------------"
echo "Creating Haiku Ruby C++ wrapper"
echo "---------------------------------"
swig -c++ -ruby -I$H -I$R -I$RCONFIG -outcurrentdir -v -macroerrors ../../swig/haiku-swig-ruby-string.i 


echo "----------------------------------"
echo "Compiling Haiku Ruby C++ wrapper"
echo "----------------------------------"
g++ $SYSINCLUDES -c -std=c++11 -fpermissive -I$H/app -I$H/support -I$R -I$RCONFIG haiku-swig-ruby-string_wrap.cxx 

echo "----------------------------------"
echo "Linking Haiku Ruby C++ wrapper"
echo "----------------------------------"
g++ -shared -o libhaikuruby.so haiku-swig-ruby-string_wrap.o -L$L -lbe -lruby

echo "----------------------------------"
echo "Done."
echo "----------------------------------"
