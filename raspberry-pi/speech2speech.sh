#!/bin/bash

echo "Recording... Press Ctrl+C to Stop."
./speech2text.sh $1
QUESTION_JSON=$(tail -n +2 stt.json)
ANSWER=$(./gettext.py $QUESTION_JSON)
./text2speech.sh $2 $ANSWER
rm stt.json  > /dev/null 2>&1