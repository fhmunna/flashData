#quick SYnc you Local Repo with repo
clear
#see git status
git status
#add un staged file
git add .
#commit changes

read -p 'INSERT COMMIT MESSAGE: ' message
git commit -m "
$message
"

#show status before push
git status
#push 
git push
#show status after push
git status
