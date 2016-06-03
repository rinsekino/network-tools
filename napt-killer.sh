#!/bin/sh

GOOGLE_DNS_1=8.8.8.8
GOOGLE_DNS_2=8.8.4.4
NTT_DNS_1=129.250.35.250
NTT_DNS_2=129.250.35.251

# i = 500 -> 2000 sessions
# i = 1000 -> 4000 sessions
# i = 1500 -> 6000 sessions
# i = 2000 -> 8000 sessions

for ((i=0;i<500;i++))
do
	sudo hping3 ${GOOGLE_DNS_1} --icmp --id `expr $i + 10000` --data 0 -c 1 -w 0 > /dev/null
	sudo hping3 ${GOOGLE_DNS_2} --icmp --id `expr $i + 20000` --data 0 -c 1 -w 0 > /dev/null
	sudo hping3 ${NTT_DNS_1} --icmp --id `expr $i + 30000` --data 0 -c 1 -w 0 > /dev/null
	sudo hping3 ${NTT_DNS_2} --icmp --id `expr $i + 40000` --data 0 -c 1 -w 0 > /dev/null
done
