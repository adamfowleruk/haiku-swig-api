import haiku
import threading

class AppRunner(threading.Thread):
    running = False
    app = None
    
    def __init__(self):
        super(AppRunner,self).__init__()
        print("In AppRunner init")
        self.app = MyApp()
        print("End of AppRunner init")
        
    def __del__(self):
        print("AppRunner dtor")
		
    def run(self):
        print("App run called")
        self.running = True
        #self.app.Lock()
        self.app.Run()
        print("Post app run")
#        while (running):
#            sleep(500)
		

class MyApp(haiku.BApplication):
    window = None
    
    def __init__(self):
        print("In MyApp init")
        super(MyApp,self).__init__("application/x-vnd.dw-MyApp")
        self.window = MainWindow()
        self.window.Show()
        print("End of MyApp init")
        
    def __del__(self):
        print("MyApp dtor")


class MainWindow(haiku.BWindow):
    def __init__(self):
        print("In MainWindow init")
        super(MainWindow,self).__init__(haiku.BRect(100,100,500,400),
			"I'm a Python Haiku App Main Window",haiku.B_TITLED_WINDOW,
			haiku.B_ASYNCHRONOUS_CONTROLS | haiku.B_QUIT_ON_WINDOW_CLOSE # conversion error as it's an octal type going to a uint32? - no, because uint32 was not recognised as an int type (using %apply to set this now)
#			haiku.WindowFlags().AsynchronousControls().Flags() # custom C++ helper class
			)
        print("End of MainWindow init")

    def __del__(self):
        print("MainWindow dtor")
        
def main():
    print("In main")
    appRunner = AppRunner()
    print("Main calling start")
    appRunner.start()
    print("AppRunner start called")
    appRunner.join()
    print("Post join()")
	
if __name__ == "__main__":
	main()

