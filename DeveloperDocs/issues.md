[Home](../README.md)

# Issues using SWIG with Haiku

## MAJOR issues

### Memory deallocation

Some classes, namely subclasses of Looper, require a Lock() to be called prior to a destructor being called. This is an open issue. It probably just requires a `%extend` declaration for a custom destructor.

### Looper in Python

Keeping python running rather than instantly quitting... Still trying to figure this one out.


## Items that cause extra work

As well as listing the Header files to generate API bindings for, some C++
code may require a little more work. These items need documenting, but
aren't generally massive issues.

### Use %ignore for friend functions

Any method with the `friend` keyword used seems to cause issues when
generating bindings in Python. A simple ignore for these (internal) methods
is enough to make things work. No practical impact on target language
developers.


### Typed enums and Python

You have to ensure SWIG knows the base type. So any enums with typed values (typically ints) need a `%apply int { TYPE_NAME };` declaration. No big issue.

Octal enum values are trickier. E.g. `B_ASYNCHRONOUS_CONTROLS`. Here you need
to develop a wrapper class that has a uint32 member, abunch of functions to
mutate this value as you apply methods (one method per octal constant),
and a final method to get the uint32 value out. See python/002-first-app/MyApp.py for an example. Again, a little annoying, but a macro could be defined for such things - if they were named enums (which unfortunately `window_flags` is NOT!)




