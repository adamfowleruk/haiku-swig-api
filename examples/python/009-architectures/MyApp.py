import haiku

sl = haiku.get_architectures()
print("First architecture listed: " + sl.First().String() )

sl = haiku.get_secondary_architectures()
print("Number of secondary architectures: " + str(sl.CountItems()) )