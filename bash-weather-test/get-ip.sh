#!/bin/bash

# bash-weather is a weather report and forecast script written in Bash.

get_ip()
{
	current_ip=$(curl -s "http://checkip.dyndns.org/" | grep -o -E "[0-9\.]+")
}
