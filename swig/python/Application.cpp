#include "Application.h"

BApplication::MessageReceived(BMessage* msg) {
  std::cout << "Do something pythonic here"
  RealBApplication::MessageReceived(msg);
};