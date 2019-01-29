#Installing the PPTP client for Linux
sudo apt-get -y install pptp-linux
#Configuring the PPTP VPN connection
sudo nano /etc/ppp/chap-secrets
# Secrets for authentication using CHAP
# client        server  secret                  IP addresses
# <username> <server_name> <password> <ip_address>
# vpnuser         workvpn password123             *

# Create a new ppp peers file for the new vpn connection.

sudo nano /etc/ppp/peers/workvpn

# Paste in the following lines, and modify to suit(Remove the '#' symbols):
# pty "pptp vpn.server.hostname.here.com --nolaunchpppd"
# name vpnuser
# remotename workvpn
# require-mppe-128
# file /etc/ppp/options.pptp
# ipparam workvpn

# Create a route script that will get run after the PPP connection establishes

sudo nano /etc/ppp/ip-up.d/99vpnroute
# add the following script removing the '#' symbol
# Replace 192.168.20.0/24 with the network mask of the remote network y


# #!/bin/bash

#if [ "$PPP_IPPARAM" == "workvpn" ]; then
#        route add -net 192.168.20.0/24 dev $PPP_IFACE
#fi


# Make the vpn route script executable:
sudo chmod +x /etc/ppp/ip-up.d/99vpnroute

# Connecting to the PPTP VPN Server

sudo pon workvpn

#or
sudo pppd call workvpn

#turn off
sudo poff workvpn
#or
sudo killall pppd
#or
sudo kill `cat /var/run/ppp0.pid`
