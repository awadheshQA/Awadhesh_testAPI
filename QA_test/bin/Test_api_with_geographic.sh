#!/bin/bash
# This script run for openweathermap current API and get the output to the report show
# To execute this script please run as './Test_api_with_geographic.sh 35 139' where lat=35&lon=139 are the arguments need to pass along script
#Author: Awadhesh Jha
#All API have taken from openweathermap.org and verified
#This script fatchs all details about city name openweathermap current weather API result
#Result will be displayed on terminal during oron completion of execution script run and also display status about weather condition
# Result you can see as City Name, Sun-Rise and Sun-Set and Temperature Max,Min


api=e987b65804b56ea596e2278d3f5f3552
#location=London
#metric='imperial'
#metric='metric'
lat="$1"
lon="$2"
#place="Sydney"
if [ $# -eq 0 ]
  then
    echo "No city name supplied"
	echo "Please run as ' ./Test_api_with_geographic.sh {lat} {lon}"
fi


#
weather=$(curl "http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&mode=xml&appid=e987b65804b56ea596e2278d3f5f3552")
#curl "http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lonmode=xml&appid=e987b65804b56ea596e2278d3f5f3552"

#echo " $weather "
echo " $weather " > test_status.log
citi_name=$(cat test_status.log | cut -d "<" -f 3,6)
sun_rise=$(cat test_status.log | cut -d "<" -f 8)
temp_max_and_min=$(cat test_status.log | cut -d "<" -f 11)
echo "################################################################################################################"
echo "********** Citi_id and Country is : $citi_name **********"
echo "********** Sun Rise,Set time is : $sun_rise          **********"
echo "********** Temperature Max and Min is : $temp_max_and_min    **********"
echo "#################################################################################################################"
rm test_status.log
#weather=$(curl -s http://api.openweathermap.org/data/2.5/weather\?APPID\=$api\&$citi_id\&units\=${metric})
#curl http://api.openweathermap.org/data/2.5/weather?q=London&mode=xml&appid=e987b65804b56ea596e2278d3f5f3552

