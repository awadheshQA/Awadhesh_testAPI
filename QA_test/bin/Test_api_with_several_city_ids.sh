#!/bin/bash
#Run this script as ./Test_api_with_several_city_ids.sh
# In This script i have hard coded multiple city id's parameter, so no need to pass just run script
# If You wish to pass bbox values as arguments you need to defined arguments passing variable
# This script result you of parameters as id=524901,703448,2643743[d1,id2,id3,.....]
# Passing value along script are  which is hard coded


echo " This script does not required any argument to pass and testing with bbox values API "
api=e987b65804b56ea596e2278d3f5f3552


weather=$(curl "http://api.openweathermap.org/data/2.5/group?id=524901,703448,2643743&units=metric&appid=e987b65804b56ea596e2278d3f5f3552")

#echo " $weather "
echo " $weather " > test_status.log
city_id1=$(cat test_status.log | cut -d "[" -f 2)
city_id2=$(cat test_status.log | cut -d "[" -f 3)
city_id3=$(cat test_status.log | cut -d "[" -f 4)
city_id4=$(cat test_status.log | cut -d "[" -f 5)
echo "################################################################################################################"
echo "********** City_id 1 output is : $city_id1 **********"
echo "********** City_id 2 output is : $city_id2          **********"
echo "********** City_id 3 output is : $citi_id3    **********"
echo "********** City_id 4 output is : $citi_id4    **********"
echo "#################################################################################################################"
rm test_status.log
#weather=$(curl -s http://api.openweathermap.org/data/2.5/weather\?APPID\=$api\&$citi_id\&units\=${metric})
#curl http://api.openweathermap.org/data/2.5/weather?q=London&mode=xml&appid=e987b65804b56ea596e2278d3f5f3552

