#!/bin/bash

# echo "Recording... Press Ctrl+C to Stop."
arecord -Dhw:0 -r 44100 -c 2 -f S32_LE rec.wav 
sox rec.wav rec.flac rate 16k

echo "Processing..."
curl --silent -X POST --user-agent "Mozilla/5.0" --data-binary @rec.flac --header "Content-Type: audio/x-flac; rate=16000;" "https://www.google.com/speech-api/v2/recognize?lang=$1&key=AIzaSyDE_hAqtnzpiRA5b3wQKoNwbM3gVYL_So8" > stt.json

rm rec.flac  > /dev/null 2>&1
rm rec.wav  > /dev/null 2>&1
