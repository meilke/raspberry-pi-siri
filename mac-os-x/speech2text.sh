#!/bin/bash

# echo "Recording... Press Ctrl+C to Stop."
~/sox-14.4.1/sox -V6 -d rec.wav > /dev/null 2>&1
~/ffmpeg/ffmpeg -i rec.wav -loglevel panic -y -ar 16000 -acodec flac rec.flac  > /dev/null 2>&1

echo "Processing..."
curl --silent -X POST --user-agent "Mozilla/5.0" --data-binary @rec.flac --header "Content-Type: audio/x-flac; rate=16000;" "https://www.google.com/speech-api/v2/recognize?lang=en-us&key=AIzaSyDE_hAqtnzpiRA5b3wQKoNwbM3gVYL_So8" > stt.json

rm rec.flac  > /dev/null 2>&1
rm rec.wav  > /dev/null 2>&1
