#!/bin/bash
#Run this script as ./Test_api_with_bbox.sh

# In This script i have hard coded some known bbox parameter, so no need to pass just run script
# If You wish to pass bbox values as arguments you need to defined arguments passing variable
# This script result you of parameters as bbox bounding box [lon-left,lat-bottom,lon-right,lat-top,zoom]
# Passing value along script are  which is hard coded

echo " This script does not required any argument to pass and testing with bbox values API "
api=e987b65804b56ea596e2278d3f5f3552


weather=$(curl "https://samples.openweathermap.org/data/2.5/box/city?bbox=12,32,15,37,10&appid=e987b65804b56ea596e2278d3f5f3552")
#curl "http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lonmode=xml&appid=e987b65804b56ea596e2278d3f5f3552"

#echo " $weather "
echo " $weather " > test_status.log
bbox_output=$(cat test_status.log | cut -d "[" -f 2)
bbox_output1=$(cat test_status.log | cut -d "[" -f 3)
bbox_output2=$(cat test_status.log | cut -d "[" -f 4)
echo "################################################################################################################"
echo "********** BBOX zone1 output is : $bbox_output **********"
echo "********** BBOX zone2 outpute is : $bbox_output1          **********"
echo "********** BBOX zone3 output is : $bbox_output2    **********"
echo "#################################################################################################################"
rm test_status.log
#weather=$(curl -s http://api.openweathermap.org/data/2.5/weather\?APPID\=$api\&$citi_id\&units\=${metric})
#curl http://api.openweathermap.org/data/2.5/weather?q=London&mode=xml&appid=e987b65804b56ea596e2278d3f5f3552

