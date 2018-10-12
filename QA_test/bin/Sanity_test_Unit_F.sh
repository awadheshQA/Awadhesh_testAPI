#!/bin/bash
# This script will cover to check Sanity level of testing for all functionalities of openweathermap current weather API in unit F
# This is written by Awadhesh Jha to test/Verify the openweathermap API
# Please add your city name which you want to test in citi_name variable list
# To Run this test You have to come on directory where this script reside and execute as './Sanity_test_Unit_F.sh
# Test result for current weather report for openweathermap you can see on terminal itself and also it stor in log file as well which you can find on ../logs/
# On new run existing log will deleted and new log will be created also  in ../logs/ you can see city wise log as well and master also 
# Enable below if you are extracting entire directory to your home directory then  do pwd and set that path to QA_HOME


#cd /QA_HOME/bin/ 
# removing log files created during last run, if you want to keep log for every run please uncomment below line
rm ../logs/Master*.log
# Test begin here and need to defin all variable like api key from openweathermap

api=e987b65804b56ea596e2278d3f5f3552
#location=London
#metric='imperial'
#metric='metric'
citi_name=(Bangalore Delhi Mumbai Bhopal Gangtok London Birmingham Manchester Glasgow Leeds Liverpool Newcastle Sheffield Madrid Barcelona Valencia Zaragoza Murcia Berlin Hamburg Madrid Barcelona Valencia Zaragoza Murcia Canberra Sydney Melbourne)

# Choose fahrenheit/Imperial or Celcius/metric:
metric='imperial' && unit='F'
#metric='metric' && unit='C'

for place in "${citi_name[@]}"; do
########################################################################
# If latlong is preferred then don't set a value for $place
if [[ -z $place ]];then
    # Geolocate IP:
    ipinfo=$(curl -s ipinfo.io)
    latlong=$(echo $ipinfo | jq -r '.loc')
    # Parse the latitude and longitude
    lat=${latlong%,*}
    long=${latlong#*,}
    location="lat=$lat&lon=$long"
else
    location="q=$place"
fi

#weather=$(curl -s http://api.openweathermap.org/data/2.5/weather\?APPID=$api\&"$location"\&units=$(metric))
 weather=$(curl -s http://api.openweathermap.org/data/2.5/weather\?APPID=$api\&"$location"\&units=$metric)
# http://api.openweathermap.org/data/2.5/weather?id=2172797&appid=b6907d289e10d714a6e88b30761fae22&unit=C
#weather=$(curl -s http://api.openweathermap.org/data/2.5/weather\?q=$1\&mode=xml\?APPID\=$api\&units\=${metric})
### TODO: better to try and put the output into a jq array, to reduce the processes :/ ###
city=$(echo $weather | jq -r '.name')
temperature=$(printf '%.0f' $(echo $weather | jq '.main.temp'))
condition=$(echo $weather | jq -r '.weather[0].main')
wind=$(echo $weather | jq '.wind.speed')
winddir=$(echo $weather | jq '.wind.deg')
humidity=$(echo $weather | jq '.main.humidity')
pressure=$(echo $weather | jq '.main.pressure') 

# Format the output with printf
echo "        ####################################################################"    
echo "        ##############***  report from $citi_name  ***######################"            
echo "        ####################################################################"  
printf "  %s: %s\n **** Wind: %d m/s, from %.3d°\n\ **** Temp: %d°C\n\ **** Humidity: %d%%\n\ **** Pressure: %d \n **** " "$city" "$condition" "$wind" "$winddir" "$temperature" "$humidity%" "$pressure" 2>/dev/null
echo "        ####################################################################" >> ../logs/$location.Test.log 
echo "        ##############***  report from $citi_name  ***######################" >> ../logs/$location.Test.log          
echo "        ####################################################################" >> ../logs/$location.Test.log
echo "%s: %s\n **** Wind: %d m/s, from %.3d°\n\ **** Temp: %d°C\n\ **** Humidity: %d%%\n\ **** Pressure: %d \n **** " "$city" "$condition" "$wind" "$winddir" "$temperature" "$humidity%" "$pressure" >> ../logs/$location.Test.log

# greping the temprature value and if API is getting then it says passed if no value then test failed

cat ../logs/$location.Test.log  | awk 'NR==6 {print $4}'
RESULT=$?
if [ $RESULT -eq 0 ]; then
echo "           ####################################################################        "
  echo "[ **     ##              Test PASSED for $citi_name                       ##     ** ]" 
echo "           ####################################################################         "
else
echo "           ####################################################################        "
  echo "[ **     ##              Test FAILED for $citi_name                       ##     ** ]"
echo "           ####################################################################         "
fi
cat ../logs/$location.Test.log >> ../logs/Masterrecord_log.log
rm ../logs/$location.Test.log
done
exit

