import haiku

l = haiku.BLocker()
print("Locked OK?: " + str(l.Lock()) )
print("IsLocked?: " + str(l.IsLocked()) )
print("Lock count: " + str(l.CountLocks()) )
print("Locking Thread: " + str(l.LockingThread()) )
print("Unlocked OK?: " + str(l.Unlock()) )
print("IsLocked?: " + str(l.IsLocked()) )