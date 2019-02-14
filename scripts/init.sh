#!/bin/bash
echo -e '\0033\0143'
echo "Starting the web framework"
yarn install &&
yarn serve &
sleep 3
trap "exit" INT
while :
do
  echo -e '\0033\0143'
  echo 'Hit CTRL+C to stop web framework'
  current_date_time="`date "+%Y-%m-%d %H:%M:%S"`";
  echo "DateTime: $current_date_time"
  sleep 10
done
