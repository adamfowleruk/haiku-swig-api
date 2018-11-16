import haiku

t = haiku.BTime.CurrentTime(haiku.B_LOCAL_TIME)
h = t.Hour()
m = t.Minute()
s = t.Second()
hs = str(h)
ms = str(m)
ss = str(s)
print("Current time: " + hs + ":" + ms + ":" + ss)

d = haiku.BDate.CurrentDate(haiku.B_LOCAL_TIME)
print("Current date: " + str(d.Year()) + "-" + str(d.Month()) + "-" + str(d.Day()))
print("Long Month Name: " + d.LongMonthName(d.Month()).String() )
