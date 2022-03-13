#!/bin/sh
# shell script to prepend i3status with more stuff

i3status | while :
do
        read line
	#playing=$(ncmpcpp --now-playing)
    
    	# Start building our JSON string
    	custom_json='"name":"active_window","markup":"pango","full_text":"test"'

    	# Encode the $playing string to JSON and append it
    	#playing_json+=$(echo -n "$playing" | python -c 'import json,sys; print json.dumps(sys.stdin.read())')

    	# Close our newly created JSON object and start a new one 
    	custom_json+='},{'

    	# Inject our JSON into $line after the first [{
    	line=${line/[{/[{$custom_json}	
        echo $line || exit 1
done
