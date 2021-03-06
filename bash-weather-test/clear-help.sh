#!/bin/bash

# bash-weather is a weather report and forecast script written in Bash.

clear_help()
{
	tput cup $((top_padding + min_term_height - 1)) \
		${left_padding} >> ${buffer}
	
	for ((i=left_padding; i < (left_padding + min_term_width); i++))
	do
		printf " " >> ${buffer}
	done
}
