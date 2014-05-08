#!/bin/bash

echo "Recording... Press Ctrl+C to Stop."
./speech2text.sh
QUESTION_JSON=$(tail -n +2 stt.json)
ANSWER=$(./queryprocess.py $QUESTION_JSON)
./text2speech.sh $ANSWER
rm stt.json  > /dev/null 2>&1