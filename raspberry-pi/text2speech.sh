#!/bin/bash

say() { local IFS=+;curl --silent --user-agent "Mozilla/5.0" "http://translate.google.com/translate_tts?tl=$1&key=AIzaSyDE_hAqtnzpiRA5b3wQKoNwbM3gVYL_So8&q=${*:2}" > test.mp3;mplayer -ao alsa:device=hw=1,0 test.mp3; }
say $1 ${*:2}
rm test.mp3

