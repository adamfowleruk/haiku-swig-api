%module haiku

%include "std_string.i"

#define __attribute__(x)

%{
#include <String.h>
%}

%ignore SetToFormat(const char*);
%ignore SetToFormatVarArgs(const char*,va_list);
%ignore ScanWithFormat(const char*);
%ignore ScanWithFormatVarArgs(const char*,va_list);


%include "/boot/system/develop/headers/os/support/String.h"

