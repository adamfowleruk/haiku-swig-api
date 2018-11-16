import haiku

sl = haiku.BStringList()
sl.Add(haiku.BString("First"))
sl.Add(haiku.BString("Second"))
sl.Add(haiku.BString("Third"))

print("First string: " + sl.First().String() + " and last string: " + sl.Last().String() )