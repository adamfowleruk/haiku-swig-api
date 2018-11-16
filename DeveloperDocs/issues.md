[Home](../README.md)

# Issues using SWIG with Haiku

## MAJOR issues

### Typed enums and Python

Outstanding bug in SWIG [#1345](https://github.com/swig/swig/issues/1345)
that means passing a `B_TITLED_WINDOW` in to Window() does not work.


## Items that cause extra work

As well as listing the Header files to generate API bindings for, some C++
code may require a little more work. These items need documenting, but
aren't generally massive issues.

### Use %ignore for friend functions

Any method with the `friend` keyword used seems to cause issues when
generating bindings in Python. A simple ignore for these (internal) methods
is enough to make things work. No practical impact on target language
developers.


