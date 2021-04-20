from urllib.request import urlopen
import ssl
from bs4 import BeautifulSoup

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

url = 'http://py4e-data.dr-chuck.net/comments_1125445.html'
html = urlopen(url, context = ctx)
soup = BeautifulSoup(html, "html.parser")

spans = soup('span')
snum = []
for span in spans:
    snum.append(int(span.string))
print(sum(snum))
