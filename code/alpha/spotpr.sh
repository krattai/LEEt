#!/bin/bash
#
# This script sould be able to grab spot pricing for exchange rate calculation
#
# https://ca.finance.yahoo.com/currencies?ltr=1
# http://finance.yahoo.com/currencies?ltr=1
#
# spot =X futures =F
#
# Copyright (C) 2017 Uvea I. S., Kevin Rattai
#
# This is an example script to grab and publishes exchange rates to social media
#

wget -O btccad.txt "http://finance.yahoo.com/d/quotes.csv?e=.csv&f=sl1d1t1&s=BTCCAD=X"
wget -O usdcad.txt "http://finance.yahoo.com/d/quotes.csv?e=.csv&f=sl1d1t1&s=USDCAD=X"
wget -O gldcad.txt "http://finance.yahoo.com/d/quotes.csv?e=.csv&f=sl1d1t1&s=XAUCAD=X"
wget -O slvcad.txt "http://finance.yahoo.com/d/quotes.csv?e=.csv&f=sl1d1t1&s=XAGCAD=X"

btc=$(awk -F "\"*,\"*" '{print $2}' btccad.txt)
usd=$(awk -F "\"*,\"*" '{print $2}' usdcad.txt)
gld=$(awk -F "\"*,\"*" '{print $2}' gldcad.txt)
slv=$(awk -F "\"*,\"*" '{print $2}' slvcad.txt)

mosquitto_pub -d -t aebl/social -m "Today: bitcoin->CAD\\\$$btc, USD->CAD\\\$$usd, silver->CAD\\\$$slv, gold->CAD\\\$$gld & 1lb flour still a loaf of bread #PSA #am2p" -h "ihdn.ca"

exit 0

