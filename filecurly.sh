#!/bin/bash

export target_file=fc.log

while :
do
    tail -F ${target_file} | grep --line-buffer -E '^#\s([0-9]|\-|\:|\,|\,|\s)+\s\[(CRITICAL|ERROR|WARN|WARNING|DEBUG|INFO|ETC)\]' | filecurly_handler.sh;
    echo 'The tailing has terminated for a while!';
    sleep 300;
done