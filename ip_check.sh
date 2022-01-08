#!/bin/bash

IP=$1

if [[ $IP =~ ^[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}$ ]];
then
  echo "checking IP=++$IP++. Contains only digits and ."
  octets_array=$(echo $IP | tr '.' ' ')
  for OCTET in ${octets_array[@]};
  do
    echo "checking $OCTET now"
    if [[ $OCTET =~ [[:digit:]] ]] && ([[ $OCTET -eq 0 && $OCTET = 0 ]] || [[ $OCTET -gt 0 && $OCTET -le 255 && $OCTET != 0* ]]);
    then
      echo "$OCTET is fine"
    else
      echo "$OCTET is invalid. $IP is not valid"
      exit 1
    fi
  done
  echo "FOUND $IP is valid"
else
  echo "Invalid ++$IP++"
fi
