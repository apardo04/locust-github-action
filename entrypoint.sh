#!/bin/sh

# `$*` expands the `args` supplied in an `array` individually 
# or splits `args` in a string separated by whitespace.

echo locustfile variable from actions = $INPUT_LOCUSTFILE
echo INPUT_URL = $INPUT_URL

if [ -z "$INPUT_LOCUSTFILE" ]
then
    file="/locustfile.py"
else
    file="/github/workspace/$INPUT_LOCUSTFILE"
fi

echo locustfile variable = $file
locust --version

sh -c "locust -f $file --headless -u 5 -r 5 --run-time 10s -H $INPUT_URL"