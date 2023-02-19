#!/bin/sh

# If user did not use the LOCUSTFILE parameter, then use the default script. Otherwise, use the one in their repo. 
if [ -z "$INPUT_LOCUSTFILE" ]
then
    file="/locustfile.py"
else
    file="/github/workspace/$INPUT_LOCUSTFILE"
fi

# If user did not use the REQUIREMENTS parameter, then use the default text file. Otherwise, use the one in their repo. 
if [ -z "$INPUT_REQUIREMENTS" ]
then
    pip install -r requirements.txt
else
    pip install -r /github/workspace/$INPUT_REQUIREMENTS
fi

# Run locust script
locust -f $file --headless -u $INPUT_USERS -r $INPUT_RATE --run-time $INPUT_RUNTIME -H $INPUT_URL