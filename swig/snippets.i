
// Messages handled entirely within C++, so need to intercept and check if Python has handled the message first
%rename(_doMessageReceived) MessageReceived;
%extend BHandler {
  %pythoncode %{
    MessageReceived = lambda self: None
  %}
}


void BHandler::MessageReceived(BMessage* message) {
  // Call python MessageReceived function
}



%pythoncode %{
from enum import Enum
def redo(prefix):
    tmpD = {k:v for k,v in globals().items() if k.startswith(prefix + '_')}
    for k,v in tmpD.items():
        del globals()[k]
    tmpD = {k[len(prefix)+1:]:v for k,v in tmpD.items()}
    # globals()[prefix] = type(prefix,(),tmpD) # pre-Enum support
    print "Setting prefix " + prefix
    if prefix != "":
        globals()[prefix] = Enum(prefix,tmpD)
redo('window_type')
del redo  # cleaning up the namespace
del Enum
%}

// Following no longer needed as flags can be composed using bitwise or

// Let's create a helper class to generate window flags
%inline %{
class WindowFlags {
public:
  WindowFlags() : _flag(0) { };
  ~WindowFlags() { };
  WindowFlags& AsynchronousControls() {
    _flag = _flag | B_ASYNCHRONOUS_CONTROLS;
	return *this;
  };
  // TODO the above for all other constants for this octal composable type
  uint32 Flags() { return _flag; };
private:
  uint32 _flag;
};
%}