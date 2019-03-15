apt-get install screen
screen #creates a default session
screen -S name #creates a session with a name. name can be used to reattach at a later stage
Ctrl-a d #detach from the current screen session you are in
screen -d SCREENID #when the command screen is running in another terminal, remote detach
screen -ls #it will list all the existing screen sessions
screen -r #attaches to default session. this works only if you have one screen session
screen -r <SCREENID> #attaches to particular screen session
screen -r name #attaches to specific session (unique name specified during the creation of the screen session )
CTRL-a k #it will ask "Really kill his window [y/n]". y for yes, n for no
screen -X -S SCREENID quit #kill detached screen session
screen -S SCREENID -X quit #kill detached screen session
screen -L #-L Tell screen to turn on automatic output logging for the windows.
less -r /home/dasunhegoda/screenlog.0
cat /home/dasunhegoda/screenlog.0
CTRL-a x #it will lock your screen session quickly while you are in the screen session
