#!/bin/bash
#
# Author: Lorenzo Padovani
# @padosoft
# https://github.com/lopadova
# https://github.com/padosoft
#

#
# Add a cron job
# ref.: http://stackoverflow.com/questions/878600/how-to-create-cronjob-using-bash
#
#write out current crontab into temp file
crontab -l > mycron

#echo new cron into cron file
echo "0	*	*	*	*	bash /root/myscript/zip-files/zipfiles.sh /my/dir/images/ images.zip /my/dir/archives/ 0 1 30 > /var/log/zipfiles.log 2>&1" >> mycron

#install new cron file
crontab mycron

#print result
echo "cronjobs added successfull!"

#remove tmp file
rm mycron
