#!/bin/bash
# simple script can be added as cron take a backup of a local directory and send to a remote location
# This works only if SSH authentication in enabled and on port 22
# Author: Abhilash Madhu
# Please change your server address and directories accordingly


RSERVER=10.10.2.186
SLOC=/etc/owncloud-client/
RLOC=/root/backup/
DATE=$(date +"%Y-%m-%d")

tar cvf /home/abhilashmadhu/backup/$DATE.tar.gz $SLOC

if [ $? -eq 0 ]
   then
       rsync -av /home/abhilashmadhu/backup/ root@10.10.2.186:/root/backup
       if [ $? -eq 0 ]
       then
       rm -rf /home/abhilashmadhu/backup/$DATE.tar.gz
       #find /home/abhilashmadhu/backup/ -mtime +1 -type f -delete
       fi
fi


