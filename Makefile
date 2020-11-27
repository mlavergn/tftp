###############################################
#
# Makefile
#
###############################################

.DEFAULT_GOAL := start

# NOTE: must be run under sudo

config:
	-sudo cp files/* /private/tftpboot
	-sudo chmod 777 /private/tftpboot
	-sudo chmod 777 /private/tftpboot/*

start: config
	-sudo launchctl load -F /System/Library/LaunchDaemons/tftp.plist
	-sudo launchctl start com.apple.tftpd

stop: clean
	-sudo launchctl stop com.apple.tftpd
	-sudo launchctl unload -F /System/Library/LaunchDaemons/tftp.plist

clean:
	-sudo rm /private/tftpboot/*

client:
	tftp localhost 69

IF := en0
dump:
	sudo tcpdump -Ani ${IF} port 69 and udp
