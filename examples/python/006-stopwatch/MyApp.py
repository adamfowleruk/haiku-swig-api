import haiku

sw = haiku.BStopWatch("MyWatch")
print("Stop Watch '" + sw.Name() + "' current time: " + str(sw.ElapsedTime()) )
