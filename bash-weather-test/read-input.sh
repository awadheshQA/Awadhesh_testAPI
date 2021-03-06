#!/bin/bash

# bash-weather is a weather report and forecast script written in Bash.

read_input()
{
	local input
	local timeout=0
	
	read -sn1 -t 57 input
	
	if (($? > 128))
	then
		timeout=1
	fi
	
	while ((timeout != 1)) && [[ "${input}" != "q" && "${input}" != "c" ]]
	do
		read -sn1 -t 57 input
		
		if (($? > 128))
		then
			timeout=1
		fi
	done
	
	if ((timeout == 1))
	then
		clear_help
		print_refresh_message
		refresh_screen
	else
		case ${input} in

		'q')
		echo "exiting"
			break
			;;
		'c')
			clear_help
			print_refresh_message
			refresh_screen
			change_unit_type
			;;
		Q)
			break
			;;
		esac
	fi
}
