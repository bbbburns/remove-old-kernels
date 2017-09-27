#!/bin/sh
# Scrounged up via Google and cobbled together with some basic shell script
# print the old kernels and remove them if acceptable

dpkg -l linux-image* | awk '/^ii/{ print $2}' | grep -v -e `uname -r | cut -f1,2 -d"-"` | grep -e [0-9] | xargs sudo apt-get --dry-run remove

echo "Really remove these? (yes / no)"
read DELETEBOOLEAN

if [ $DELETEBOOLEAN = "yes" ]; then
  echo "OK, I'll do it!"
  dpkg -l linux-image* | awk '/^ii/{ print $2}' | grep -v -e `uname -r | cut -f1,2 -d"-"` | grep -e [0-9] | xargs sudo apt-get -y remove
else
  echo "Fine, I won't."
fi
