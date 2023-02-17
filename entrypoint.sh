#!/bin/sh

if [ -z "$INPUT_LOCUSTFILE" ]
then
    file="/locustfile.py"
else
    file="/github/workspace/$INPUT_LOCUSTFILE"
fi

if [ -z "$INPUT_REQUIREMENTS" ]
then
    pip install -r requirements.txt
else
    pip install -r /github/workspace/$INPUT_REQUIREMENTS
fi

locust -f $file --headless -u $INPUT_USERS -r $INPUT_RATE --run-time $INPUT_RUNTIME -H $INPUT_URL