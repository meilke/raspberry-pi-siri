#!/usr/bin/python

import sys
import json

input_string = ' '.join(sys.argv[1:])

if input_string:
    d = json.loads(input_string)
    query = d['result'][0]['alternative'][0]['transcript']
    print(query)
else:
    print("Sorry, I am not sure.")
