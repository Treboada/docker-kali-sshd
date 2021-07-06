#!/bin/bash

# check if password is set
if [ "$KALI_PASS" == "_set_this_" ] ; then
	echo "NO WAY: set KALI_PASS environment variable!"
	sleep 120
else
	echo "root:$KALI_PASS" | /usr/sbin/chpasswd
fi

SSHD_OPTS="-e -4 -D -o PermitRootLogin=yes"

# Create the PrivSep empty dir if necessary
if [ ! -d /run/sshd ]; then
	mkdir /run/sshd
	chmod 0755 /run/sshd
fi

/usr/sbin/sshd $SSHD_OPTS


