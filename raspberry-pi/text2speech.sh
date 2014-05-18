#!/bin/bash

say() { local IFS=+;mplayer -ao alsa -really-quiet -noconsolecontrols "http://translate.google.com/translate_tts?tl=$1&key=AIzaSyDE_hAqtnzpiRA5b3wQKoNwbM3gVYL_So8&q=${*:2}"; }
say $1 ${*:2}
#rm test.mp3  > /dev/null 2>&1
