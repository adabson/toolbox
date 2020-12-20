import requests, urllib.error, urllib.parse

url = 'https://www.dabson.co'

response = requests.get(url)
webContent = response.content

f = open('d.html', 'wb')
f.write(webContent)
f.close