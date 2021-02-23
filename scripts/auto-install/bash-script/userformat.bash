#!/bin/bash
# Automatically create users and assign groups
# Assumes program is run by root

# username
read -p "Enter a username: " uname

# group specification
group=""
counter=1
printf "Type in user groups, one per line or type \q to exit.\n"
while :; do
	# read every group as input, then add to group string
	read -r -p "Group $counter: " REPLY 
	
	# check the reply for '\q'
	# break if entered, continue if not
	[[ "$REPLY" == "\q" ]] && break || group="$REPLY $group"; counter=$(expr $counter + 1)
done

# format out spaces
group="$(printf $group | sed -r 's/ +/,/g')"

# create the account
useradd $uname -mG $group 

# set password
passwd $uname
