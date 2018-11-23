#include "/boot/system/develop/headers/os/app/Application.h"

class BApplication: public RealBApplication {
public:
  BApplication(const char* signature): RealBApplication(signature);
  virtual ~BApplication();
  void MessageReceived(BMessage* msg);
};
