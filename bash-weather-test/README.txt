# bash-weather

# For Other Test like all funtionality tests you can go to QA_test Directory and run test scripts which are available under /bin/
#This is readme  help document how to run the script and and may be you have press ctrl+C **

## Contents
 1. [About](#1-about)
 2. [Prerequisites](#3-prerequisites)
 3. [Exit status](#4-exit-status)
 4. [How to use](#5-how-to-use)
  * [Get bash-weather](#get-bash-weather)
  * [Start bash-weather](#start-bash-weather)
     * [Command-line options](#command-line-options)
         * [Examples](#examples)
  * [Keyboard functions](#keyboard-functions)

***

## 1. About

Weather report written in Bash.

bash-weather gets the computer's public IP address through [DynDNS](http://checkip.dyndns.org/) and uses geolocation ([http://freegeoip.net/](http://freegeoip.net/)) to acquire its current location which is used to get weather condition and forecast from [OpenWeatherMap](http://openweathermap.org/).


This suite for only to test weathermap api report  

## 3. Prerequisites

 * OpenWeatherMap API key ([http://openweathermap.org/appid](http://openweathermap.org/appid)).
 * Bash shell ≥ 4.2.
 * A terminal with a size of at least 80×22 (80 columns, 22 rows).
 * `bc` basic calculator for floating point arithmetic. Can be found in the `bc` package on major Linux distributions.
 * `curl` command-line tool for getting data using HTTP protocol. cURL can be found in the `curl` package on major Linux distributions.
 * `grep` command-line tool used for parsing downloaded XML data. `grep` can be found in the `grep` package on major Linux distributions.
 * `tput` for terminal handling. Can be found in different `ncurses` packages on Linux distributions (see the table below for major distros).

| Distrbution | Package name    |
| ----------- | --------------- |
| Arch Linux  | `ncurses`       |
| Debian      | `ncurses-bin`   |
| Fedora      | `ncurses`       |
| openSUSE    | `ncurses-utils` |
| Ubuntu      | `ncurses-bin`   |

## 4. Exit status

 * `0` bash-weather exited successfully.
 * `1` Missing necessary programs to run bash-weather, or wrong command-line arguments.
 * `2` Too small terminal size (< 80×22).
 * `3` Missing OpenWeatherMap API key.

## 5. How to use

### Get bash-weather

First you have to acquire bash-weather:

```bash
git clone github url
Download it from email and copy to your Linux machine

Or FTP from your local machine or where ever you have source
```

Enter bash-weather_test's directory:

```bash
cd bash-weather_test
```

Add your OpenWeatherMap API key to the end of the `openweathermap.key` file, e.g.

```text
# Add your OpenWeatherMap API key below (http://openweathermap.org/appid)
```

### Start bash-weather

Use the Bash interpreter to start the script:

```bash
bash bash-weather_test.sh
OR
./bash-weather_test.sh

```
#### Command-line options

bash-weather can be started with the following command line options:

 * `-k` Specifies OpenWeatherMap API key from the command-line.
 * `-h` Prints a simple help to the screen, and exits.
 * `-t city_name` Sets the city for manual weather lookup.
 * `-c country_code` Sets the country for manual weather lookup.
 * `-f` Enables colored output.

_Note: If the OpenWeatherMap API key is specified from the command-line, it will override the API key set in the `openweathermap.key` file._

##### Examples

Get the current weather in Las Vegas:

```bash
bash bash-weather.sh -t "Las Vegas" -c US
```

_Note: don't forget to enclose city names that consist of more than one word within quotes._

Get the current weather in London:

```bash
bash bash-weather.sh -t London -c UK
```

Get the current weather at your current location by specifying the OpenWeatherMap API key from the command-line:

```bash
bash bash-weather.sh -k yourkey
```

Get the current weather in Christchurch, New Zealand with colored output:

```bash
bash bash-weather.sh -c UK -t London -f
```

_Note: the terminal emulator must support 16 colors (e.g. xterm, GNOME Terminal, Konsole); displayed colors may vary in different terminal emulators and by custom profile settings._

### Keyboard functions

If you downloaded, and started bash-weather then you'll see a screen like this:

```text
                                  bash-weather                                  
                                                                                
 BUDAPEST, HUNGARY _________________                     oo                     
  ___   __  _   _____                       .            **            .        
 |__ \ /_ |(_) / ____|                       *'.         **         .'*         
    ) | | |   | |                             '*o.       **       .o*'          
   / /  | |   | |                               '*'     .''.     '*'            
  / /_  | |   | |____                               .'********'.                
 |____| |_|    \_____|                             o************o               
                                                  o**************'              
 wind: 27.7 km/h, SW                     'oooooo' **************** 'oooooo'     
                                                  '**************'              
 3 Day Forecast ____________________               '************'               
                                                     ,o******o,                 
     Wed         Thu         Fri               .o*'      **      '*o.           
 ___________ ___________ ___________         ,o*'        **        '*o,         
                                           ,o            **            o,       
  Clear Sky   Cloudy      Clear Sky                      oo                     
                                                                                
 min:  13 C        14 C        11 C                   CLEAR SKY                 
 max:  20 C        17 C        18 C                                             
                                                     Change unit: 'c', Quit: 'q'
```

_Note: bash-weather will refresh the current weather and forecast every minute._

Keyboard functions:

 * `c` Changes the measurement unit (Celsius → Fahrenheit, Fahrenheit → Celsius).
 * `q` Quits bash-weather.
