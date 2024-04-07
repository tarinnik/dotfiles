#!/bin/sh

echo "****** ARCH INSTALL SCRIPT ******"

# Input hostname
echo -n "Enter hostname: "
read hostname

# Input username
echo -n "Enter username: "
read username

# Input hard drive encryption password
echo -n "Enter hard drive encryption password: "
read -s encryptpass
echo $encryptpass
