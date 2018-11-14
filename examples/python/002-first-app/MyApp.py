import haiku

class MyApp(haiku.BApplication):
    def __init__(self):
        haiku.BApplication("application/x-vnd.dw-MyApp")


def main():
    app = MyApp()
    app.Run()


