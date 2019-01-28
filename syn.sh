#quick SYnc you Local Repo with repo
clear
#see git status
git status
#add un staged file
git add .
#commit changes
git commit -m "
$1
"
#show status before push
git status
#push 
git push
#show status after push
git status
