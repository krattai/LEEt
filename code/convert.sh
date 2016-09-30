#!/bin/bash
#
# Converts currencies
#
# Copyright (C) 2016 Uvea I. S., Kevin Rattai
#
# This code should wait on requests, convert, and respond with answer

cd $HOME

touch .pub

while [ -f ".pub" ]; do

    mosquitto_sub -h ihdn.ca -t "aebl/noo/social" |
    while IFS= read -r line
        do
#           if [[ $line = "sixxs alive" ]]; then
#               echo "$(date +"%T") - sixxs ACK"
#               echo " "
#           fi
#           if [[ $line == *"ihdnsrvr IPv6"* ]]; then
#               echo "$(date +"%T") - ihdnsrvr ACK"
#               echo "$line"
#               echo " "
#           fi
#           if [[ $line == *"played"* ]]; then
#               echo "$(date +"%T") - play log"
#               echo "$line"
#               echo " "
#           fi
#

            # Append file to playlist
#             echo "$line" >> "${CONTENT}"
              $HOME/tmpdir_maintenance/mod_Twitter/./tcli.sh -c statuses_update -s "${line}." &

        done

done

# tput clear
exit 0
