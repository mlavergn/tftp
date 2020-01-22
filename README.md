# tftp

A simple Makefile to control the tftp server on macOS. The caveat is that it must be run under sudo since it requires control of a service.

## Setup

Simply place the firmware into /files and the script will copy them to the tftpboot dir on start and remove them from the tftpboot on stop.

## Firmware

This is typically used to serve firmware on startup to devices.  Devices typically use a predefeined IP address to search for firmware, so remember to set a static IP and use the 255.255.255.0 netmask prior to attempting to flash.

## Usage

```bash
# before attempting to start or stop
sudo bash

# start the tftp server (sudo)
make start

# stop the tftp server (sudo)
make stop

# test the server (user)
tftp localhost 69
get banksy.jpg
```
