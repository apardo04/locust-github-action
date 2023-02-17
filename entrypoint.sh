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
    echo "ayy In the then requirements IF"
else
    pip install -r /github/workspace/$INPUT_REQUIREMENTS
    echo "ayy in the else requirements IF"
fi

locust -f $file --headless -u $INPUT_USERS -r $INPUT_RATE --run-time $INPUT_RUNTIME -H $INPUT_URL