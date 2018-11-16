#!/bin/sh

echo "WARNING: You must run ./build-python.sh from the root folder before executing this example"

export PYTHONPATH="../../../generated/swig-python:/boot/system/lib"

echo "Python path: $PYTHONPATH"
python MyApp.py

