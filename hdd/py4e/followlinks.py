from urllib.request import urlopen
from bs4 import BeautifulSoup
import ssl

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

url = 'http://py4e-data.dr-chuck.net/known_by_Arann.html'
count = int(input("Enter Count: "))
position = int(input("Enter Position: "))

names = []
# testing
while count > 0:
    print("retrieving: {0}".format(url))
    html = urlopen(url, context=ctx).read()
    soup = BeautifulSoup(html, 'html.parser')
    atags = soup('a')
    name = atags[position-1].string
    names.append(name)
    url = atags[position-1]['href']
    count -= 1
print(names[-1])
