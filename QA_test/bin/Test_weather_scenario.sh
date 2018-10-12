#!/bin/bash

api=e987b65804b56ea596e2278d3f5f3552
#location=London
#metric='imperial'
#metric='metric'
place="$1"
#place="Sydney"
if [ $# -eq 0 ]
  then
    echo "No city name supplied"
	echo "Please run as ' Test_weather_scenario.sh Sysdney"
fi

# Choose fahrenheit/Imperial or Celcius/metric:
#metric='imperial' && unit='F'
metric='metric' && unit='C'

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

weather=$(curl -s http://api.openweathermap.org/data/2.5/weather\?APPID\=$api\&$location\&units\=${metric})
### TODO: better to try and put the output into a jq array, to reduce the processes :/ ###
city=$(echo $weather | jq -r '.name')
temperature=$(printf '%.0f' $(echo $weather | jq '.main.temp'))
condition=$(echo $weather | jq -r '.weather[0].main')
wind=$(echo $weather | jq '.wind.speed')
winddir=$(echo $weather | jq '.wind.deg')
humidity=$(echo $weather | jq '.main.humidity')
pressure=$(echo $weather | jq '.main.pressure') 

# Format the output with printf
printf "%s: %s\n **** Wind: %d m/s, from %.3d°\n\ **** Temp: %d°C\n\ **** Humidity: %d%%\n\ **** Pressure: %d \n **** " "$city" "$condition" "$wind" "$winddir" "$temperature" "$humidity%" "$pressure" 2>/dev/null

exit
