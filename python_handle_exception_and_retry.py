def tryAgain(retries=0):
    if retries > 10: return
    try:
        # Do stuff
    except:
        retries+=1
        tryAgain(retries)

tryAgain()
