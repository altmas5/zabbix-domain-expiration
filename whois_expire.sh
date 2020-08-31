#!/bin/bash

if [ $# -ne 1 ]; then
        echo "usage: $0 domain_name"
        exit 1
fi

domain=$1

if [[ $domain == *"www"* ]]; then
  domain=`echo $1|cut -c5-`  
fi

expiration_string=`whois "$domain" 2>&1 |  egrep -i 'Expiration|Expires on|Expiry date|paid-till' | head -1  | awk '{print $NF}'`
if [ $? -ne 0 ]; then
        echo "ERROR executing whois for the $domain domain - $expiration_string"
        exit 1
fi

expiration_epoch=`date --date="$expiration_string" '+%s'`
rightnow_epoch=`date '+%s'`

seconds_left=`expr $expiration_epoch - $rightnow_epoch`
days_left=`expr $seconds_left / 86400`

echo $days_left
