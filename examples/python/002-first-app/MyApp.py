import haiku

class MyApp(haiku.BApplication):
    def __init__(self):
        haiku.BApplication.__init__(self,"application/x-vnd.dw-MyApp")
        window = MainWindow()
        window.Show()


class MainWindow(haiku.BWindow):
    def __init__(self):
        haiku.BWindow.__init__(self,haiku.BRect(100,100,500,400),
			"I'm a Python Haiku App Main Window",haiku.B_TITLED_WINDOW,
#			haiku.B_ASYNCHRONOUS_CONTROLS # conversion error as it's an octal type going to a uint32
			haiku.WindowFlags().AsynchronousControls().Flags() # custom C++ helper class
			)

def main():
    app = MyApp()
    app.Run()
	
if __name__ == "__main__":
	main()

