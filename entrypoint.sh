#!/bin/sh
echo "In entrypoint.sh"

printenv | more

if [ -z "$INPUT_LOCUSTFILE" ]
then
    file="/locustfile.py"
else
    file="/github/workspace/$INPUT_LOCUSTFILE"
fi

locust -f $file --headless -u $INPUT_USERS -r $INPUT_RATE --run-time $INPUT_RUNTIME -H $INPUT_URL