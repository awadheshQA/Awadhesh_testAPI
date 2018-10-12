#!/bin/bash
# This test is for to test city along country name, you have to pass city name with option along country name below is the exaample of run 
# Please run indivisualy this scripts as './Test_weather_parameter.sh'
# If are interested to run with argument passing along base script the run as ' bash ../../bash-weather-test/bash-weather.sh -t London -c UK
# In this script i have hardcode  city name and country names for testing purpose
# If want to pass any city and country name which is not hdded as variable then
# Go to test directory where 'bash-weather.sh' available then you have to run only ./bash-weather.sh along options (exmple: ./bash-weather.sh -t London -c UK )  
# Please increase sleep time value if api is responding in a minutes or more based on that you change then you will get data
#If it write empty output fropm API then increase sleep time valeue after script executed
# Below test starting

echo " Test being executed and fatching data from openweathermap current API "
country=(India UK Germany Spain)
for cont in "${country[@]}"; do
if [ $cont == "India" ]
then 
citi=(Bangalore Delhi Mumbai Bhopal Gangtok)

for ci in "${citi[@]}"; do
bash ../../bash-weather-test/bash-weather.sh -t $ci -c $cont > $ci.txt &
sleep 10
# Get its PID
PID=$!
# Wait for 2 seconds
sleep 5
# Kill it
kill $PID
done
else
echo ""
citi_name = `cat $ci.txt | cut -d "<" -f 3,6`
sun_rise = `cat $ci.txt | cut -d "<" -f 8`
temp_max_and_min = `cat $ci.txt | cut -d "<" -f 11`

echo "********** Citi_name and Country is : $citi_name **********"
echo "********** Sun Rise time is : $sun_rise          **********"
echo "********** Temperature Max and Min is : $temp_max_and_min    **********"

fi

if [ $cont == "UK" ]
then 
citi=(London Birmingham Manchester Glasgow Leeds Liverpool Newcastle Sheffield)

for ci in "${citi[@]}"; do
bash ../../bash-weather-test/bash-weather.sh -t $ci -c $cont > $ci.txt &
sleep 10
# Get its PID
PID=$!
# Wait for 2 seconds
sleep 5
# Kill it
kill $PID
done
else
echo ""
citi_name = `cat $ci.txt | cut -d "<" -f 3,6`
sun_rise = `cat $ci.txt | cut -d "<" -f 8`
temp_max_and_min = `cat $ci.txt | cut -d "<" -f 11`

echo "********** Citi_name and Country is : $citi_name **********"
echo "********** Sun Rise time is : $sun_rise          **********"
echo "********** Temperature Max and Min is : $temp_max_and_min    **********"
fi
done
