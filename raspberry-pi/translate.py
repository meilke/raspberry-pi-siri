import sys
import http.client
import json
from xml.dom.minidom import parse, parseString
import urllib

tokenConn = http.client.HTTPSConnection("datamarket.accesscontrol.windows.net")
tokenConn.request(
	"POST", 
	"/v2/OAuth2-13", 
	"grant_type=client_credentials&client_id=Speech-Test-CME&client_secret=FGVsMXExxwHLGO5Rmnnn5iZG%2BziHk8q4bFCdyfshZ5c%3D&scope=http://api.microsofttranslator.com",
	{"Content-type": "application/x-www-form-urlencoded", "Accept": "application/json"})
tokenResponse = tokenConn.getresponse()
tokenResponseString = tokenResponse.read().decode("utf-8")
token = json.loads(tokenResponseString)

tokenConn.close()

fromLanguage = sys.argv[1]
toLanguage = sys.argv[2]
inputString = ' '.join(sys.argv[3:])

translateConn = http.client.HTTPConnection("api.microsofttranslator.com")
translateConn.request(
	"GET", 
	"/v2/Http.svc/Translate?text=" + urllib.parse.quote(inputString) + "&from=" + fromLanguage + "&to=" + toLanguage, 
	"",
	{"Authorization": "Bearer " + token['access_token'], "Content-type": "application/json"})
translateResponse = translateConn.getresponse()
translateResponseString = translateResponse.read().decode("utf-8")

dom = parseString(translateResponseString)

print(dom.documentElement.firstChild.nodeValue)	