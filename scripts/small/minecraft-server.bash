#!/bin/bash
# USAGE: minecraft-server $port $startingRAM $maxRAM $world

# check if arguments supplied 
if [[ -z "$1" || "$1" == "help" ]]
then
    echo "USAGE: minecraft-server \$port \$startingRAM \$maxRAM \$world"
    exit
# check if enough arguments are supplied
elif [[ -z "$4" ]]
then
    echo "Not enough arguments supplied, please check usage"
    exit
fi

# check if the port is in use
if [[ -z "$(ss -na | grep :$1)" ]]
then
    # open port
    sudo iptables -A INPUT -p udp --dport $1 -j ACCEPT
else
    echo "port is already in use"
    exit
fi

# check if available memory is more than max
# if [[ $(free -h | grep Mem | awk -F " " '{print $7}') ]]

# start the server
sudo java -Xmx$3 -Xms$2 -jar server.jar --port $1 --world $4 --nogui
