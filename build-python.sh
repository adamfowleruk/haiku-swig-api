#!/bin/bash
H=/home/system/sources/haiku/headers
L=/home/system/lib
mkdir -p generated/swig-python
cd generated/swig-python
swig -c++ -python -I$H -outcurrentdir -v ../../swig/haiku-swig-python.i 
g++ haiku-swig-python_wrap.cxx -I$H
#g++ -shared -L$L/libbe.so haiku-swig-python.c haiku-swig-python,so

