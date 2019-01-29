# install dependency
sudo apt-get install pptp-linux pptpd ppp curl
# check
modprobe ppp-generic
#creat pptp  vpn configuration file
nano /etc/ppp/peers/tgvpn
# (replace 124.123.123.123 is the IP of the PPTP server you want to connect to, and MYTGACCOUNTUSERNAME with your VPN username)

# pty "pptp 123.123.123.123 --nolaunchpppd"
# lock
# noauth
# nobsdcomp
# nodeflate
# name MYTGACCOUNTUSERNAME
# remotename tgvpn
# ipparam tgvpn
# require-mppe-128
# usepeerdns
# defaultroute
# persist



# Enter VPN login credentials into chap-secrets file: 
sudo nano /etc/ppp/chap-secrets
# username[tab]tgvpn[tab]password[tab]*

# Create script to replace default routes - otherwise the VPN is not being used by your system:
sudo nano /etc/ppp/ip-up.local

# #!/bin/bash
# H=`ps aux | grep 'pppd pty' | grep -v grep | awk '{print $14}'`
# DG=`route -n | grep UG | awk '{print $2}'`
# DEV=`route -n | grep UG | awk '{print $8}'`
# route add -host $H gw $DG dev $DEV
# route del default $DEV
# route add default dev ppp0

# Make this script executable:
sudo chmod +x /etc/ppp/ip-up.local

# To connect to the VPN:

pon tgvpn
# To disconnect from the VPN:

poff tgvpn
