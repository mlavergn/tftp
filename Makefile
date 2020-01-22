###############################################
#
# Makefile
#
###############################################

.DEFAULT_GOAL := start

# NOTE: must be run under sudo

config:
	cp files/* /private/tftpboot
	chmod 777 /private/tftpboot
	chmod 777 /private/tftpboot/*

start: config
	launchctl load -F /System/Library/LaunchDaemons/tftp.plist
	launchctl start com.apple.tftpd

stop: clean
	launchctl stop com.apple.tftpd
	launchctl unload -F /System/Library/LaunchDaemons/tftp.plist

clean:
	rm /private/tftpboot/*

client:
	tftp localhost 69

dump:
	tcpdump -Ani en0 port 69 and udp
