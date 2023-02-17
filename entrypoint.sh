#!/bin/sh

if [ -z "$INPUT_LOCUSTFILE" ]
then
    file="/locustfile.py"
else
    file="/github/workspace/$INPUT_LOCUSTFILE"
fi

if [ -e /requirements.txt ]
then
    echo "In the requirements IF"
else
    echo "NOT In the requirements IF"
fi

if [ -e /github/workspace/requirements.txt ]
then
    echo "In the github/workspace/requirements IF"
    pip install -r /github/workspace/requirements.txt
    # Remove: this is for testing
    pip show Flask
    pip show pandas
else
    echo "NOT In the github/workspace/requirements IF"
fi

locust -f $file --headless -u $INPUT_USERS -r $INPUT_RATE --run-time $INPUT_RUNTIME -H $INPUT_URL