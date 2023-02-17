#!/bin/sh
echo "ayy test echo"

if [ -z "$INPUT_LOCUSTFILE" ]
then
    file="/locustfile.py"
else
    file="/github/workspace/$INPUT_LOCUSTFILE"
fi

if [ -n "$INPUT_REQUIREMENTS" ]
then
    pip install -r /github/workspace/$INPUT_REQUIREMENTS
    echo "ayy In the requirements IF"
else
    echo "ayy No requirement file"
fi

locust -f $file --headless -u $INPUT_USERS -r $INPUT_RATE --run-time $INPUT_RUNTIME -H $INPUT_URL