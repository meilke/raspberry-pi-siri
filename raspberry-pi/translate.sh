#!/bin/bash

echo "Recording... Press Ctrl+C to Stop."
./speech2text.sh $1
QUESTION_JSON=$(tail -n +2 stt.json)
QUESTION=$(python gettext.py $QUESTION_JSON)

echo $QUESTION

TRANSLATED_QUESTION=$(python3.2 translate.py $1 $2 $QUESTION)

echo $TRANSLATED_QUESTION

./text2speech.sh $2 $TRANSLATED_QUESTION

rm stt.json  > /dev/null 2>&1
