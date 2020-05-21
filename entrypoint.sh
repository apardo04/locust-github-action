#!/bin/sh

# `$*` expands the `args` supplied in an `array` individually 
# or splits `args` in a string separated by whitespace.
if [ -z ${locustfile+x} ]; then
    file = "/locustfile.py"
else
    file = "/github/workspaces/$locustfile"
fi

echo locustfile variable = $file

sh -c "locust -f $file --headless -u 5 -r 5 --run-time 10s -H $URL"