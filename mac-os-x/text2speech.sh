#!/bin/bash

say() { local IFS=+;curl --silent --user-agent "Mozilla/5.0" "http://translate.google.com/translate_tts?tl=en&key=AIzaSyDE_hAqtnzpiRA5b3wQKoNwbM3gVYL_So8&q=$*" > test.mp3;afplay test.mp3; }
say $*
rm test.mp3  > /dev/null 2>&1