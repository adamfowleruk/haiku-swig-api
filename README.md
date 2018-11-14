# haiku-swig-api
SWIG based bindings for Haiku's C++ API in different languages

This is a short spike project to test out the viability of using SWIG to 
generate bindings for multiple client libraries. This would effectively
allow Python, Ruby et al to use the Haiku/Be APIs from within their
own languages, using those languages' own idioms.

## Current status

A basic BString example is working.

```sh
./build-python-string.sh
cd examples/python/001-string
./run.sh
```

The above will construct a BString from within Python, then print out 
it's contents to standard out (the terminal)

## Other examples

There is also a system beep example:-

```sh
./build-python-beep.sh
cd examples/python/000-beep
./run.sh
```

This should give a system beep. Sounds doesn't work on my vm so I couldn't test it.

## Next steps

Next steps are to get the BApplication class working so you can define
a GUI app within Python.
