#!/usr/bin/python

import wolframalpha
import sys
import json

app_id = '9H98RG-748UXH8628'

client = wolframalpha.Client(app_id)

input_string = ' '.join(sys.argv[1:])

if input_string:
    d = json.loads(input_string)
    query = d['result'][0]['alternative'][0]['transcript']
    res = client.query(query)

    if len(res.pods) > 0:
        texts = ""
        pod = res.pods[1]
        if pod.text:
            texts = pod.text
        else:
            texts = "I have no answer for that"
        # to skip ascii character in case of error
        texts = texts.encode('ascii', 'ignore')
        print texts
    else:
        print "Sorry, I am not sure."
else:
    print "Sorry, I am not sure."
