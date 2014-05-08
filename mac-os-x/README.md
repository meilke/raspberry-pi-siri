Mac OS X
=================

Usage
-----------------

Running `./main.sh` will

1. Record question to temporary WAV file
2. Convert it to FLAC file
3. HTTP POST it to Google Speech API to get string representation of question
4. Ask Wolfram Alpha API for answer
5. Use Google Translate API for converting it to a spoken answer