%module haiku

%include "std_string.i"

// String.h :-
#define __attribute__(x)
// Architecture.h :-
#define __BEGIN_DECLS /*
#define __END_DECLS */

// special handling for Haiku OS types
%apply int { int32 };
%apply const int& { const int32& };
// kernel/OS.h :-
%apply int { thread_id };
%apply const int& { const thread_id& };
%apply int { area_id };
%apply const int& { const area_id& };
%apply int { sem_id };
%apply const int& { const sem_id& };
%apply int { team_id };
%apply const int& { const team_id& };
%apply int { thread_id };
%apply const int& { const thread_id& };
// DateTime.h and StopWatch.h :-
%apply long { bigtime_t };
%apply const long& { const bigtime_t& };
// Window.h :-
// %apply int { window_type };
// %apply int { window_look };
// %apply int { window_feel };
// %apply int { window_alignment }; 
// may need to be bool? (0 or 1)
%apply int { uint32 };

%{
#include <Beep.h>
#include <Errors.h>
#include <TypeConstants.h>
#include <Locker.h>
#include <String.h>
#include <DateTime.h>
#include <StopWatch.h>
#include <List.h>
#include <StringList.h>
/* #include <Architecture.h> */
#include <Flattenable.h>
#include <Window.h>
#include <Application.h>
#include <Handler.h>
#include <Point.h>
#include <Rect.h>
#include <View.h>
%}

// Basic standalone classes

%include "/boot/system/develop/headers/os/support/Beep.h"

%include "/boot/system/develop/headers/os/support/Errors.h"

%include "/boot/system/develop/headers/os/support/TypeConstants.h"

%include "/boot/system/develop/headers/os/support/Locker.h"

%ignore SetToFormat(const char*);
%ignore SetToFormatVarArgs(const char*,va_list);
%ignore ScanWithFormat(const char*);
%ignore ScanWithFormatVarArgs(const char*,va_list);
%include "/boot/system/develop/headers/os/support/String.h"

%include "/boot/system/develop/headers/os/support/DateTime.h"

%include "/boot/system/develop/headers/os/support/StopWatch.h"

%include "/boot/system/develop/headers/os/support/List.h"

%include "/boot/system/develop/headers/os/support/StringList.h"

// %ignore get_architecture();
// %ignore get_primary_architecture();
// %ignore get_secondary_architectures(const char**,size_t);
// %ignore get_architectures(const char**,size_t);
// %ignore guess_architecture_for_path(const char*);
// %include "/boot/system/develop/headers/os/support/Architecture.h"



// dependency tree classes

%include "/boot/system/develop/headers/os/support/Flattenable.h"

%include "/boot/system/develop/headers/os/support/Archivable.h"

%ignore _get_object_token_(const BHandler*);
%include "/boot/system/develop/headers/os/app/Handler.h"
%include "/boot/system/develop/headers/os/app/Looper.h"
%include "/boot/system/develop/headers/os/app/Application.h"

%include "/boot/system/develop/headers/os/interface/Point.h"
%include "/boot/system/develop/headers/os/interface/Rect.h"
%include "/boot/system/develop/headers/os/interface/View.h"

%ignore _safe_get_server_token_(const BLooper*,int32*);
%ignore BWindow::BWindow(BRect,const char*,window_look,window_feel,uint32);
%ignore BWindow::BWindow(BRect,const char*,window_look,window_feel,uint32,uint32);
%ignore BWindow::BWindow(BRect,const char*,window_type,uint32);
%ignore BWindow::BWindow(BMessage*);
%nodefaultctor BWindow;
%nodefaultdtor BWindow;
%include "/boot/system/develop/headers/os/interface/Window.h"
%extend BWindow {
  ~BWindow() {
    Lock();
  }
}

// Let's create a helper class to generate window flags
%inline %{
class WindowFlags {
public:
  WindowFlags() : _flag(0) { };
  WindowFlags& AsynchronousControls() {
    _flag = _flag || B_ASYNCHRONOUS_CONTROLS;
	return *this;
  };
  // TODO the above for all other constants for this octal composable type
  uint32 Flags() { return _flag; };
private:
  uint32 _flag;
};
%}

