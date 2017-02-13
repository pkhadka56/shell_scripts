#!/bin/bash
# Following script will find the A record of a domain, find its nameserver i
# and print nameserver ip address. It takes one domains.txt file which have
# list of domain names.
#
# Usage:
# sh arecord.sh 
#

input="domains.txt"
while IFS= read -r var
do
  echo $var "-->" `dig +short $var`
  nameserver=`host -t ns $var | awk '{print $4}'`
  for i in $nameserver; do
    echo $i "-->" `dig +short $i`
  done
  echo
done < "$input"
