# 001 Generate Key
ssh-keygen
#>>Enter passphrase (empty for no passphrase): 
#>>Enter same passphrase again: 
#when prompt hit enter for default location
#>>Your identification has been saved in /home/mun/.ssh/id_rsa.
#>>Your public key has been saved in /home/mun/.ssh/id_rsa.pub. 

#see existig key
ls ~/.ssh 
#>>id_rsa  id_rsa.pub  known_hosts



# 002 Add the key to the ssh-agent
eval `ssh-agent`
#>>Agent pid 7993

#add private key path to the agent
ssh-add ~/.ssh/<private_key_file>
#>> Identity added: /home/mun/.ssh/id_rsa (/home/mun/.ssh/id_rsa)


# 003 Add the public key to your preffered remote

#to View the public key
cat ~/.ssh/id_rsa.pub

# Copy and past the key to remote
