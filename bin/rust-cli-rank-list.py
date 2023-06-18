#!/bin/python3
import requests
import sys
from bs4 import BeautifulSoup
from tabulate import tabulate
import pandas as pd


URL = 'https://lib.rs/search?q=' + sys.argv[1]

page = requests.get(URL)
soup = BeautifulSoup(page.content, 'html.parser')

# find all package names
divs = soup.select('.h > h4')
names=[]
for div in divs:
    names.append(div.text.strip())

# find all descriptions
divs = soup.select('.h > p')
descs=[]
for div in divs:
    descs.append(div.text.strip())

# find all package downloads

metas = soup.select('.meta')
downloads=[]
for meta in metas:
    if(mytitle:=meta.find(class_='downloads')):
        parts = str(mytitle).split()[2].split('="')[1]
        downloads.append(int(parts))
    else:
        # some libraries do not have downloads class
        downloads.append(0)

# create a dataframe using pandas
data_tuples = list(zip(names,downloads,descs))
# set max column width
pd.set_option('max_colwidth', 400)
df=pd.DataFrame(data_tuples, columns=['Name','Downloads','Description'])

# sort by number of downloads
df = df.sort_values(by='Downloads', ascending=False)

#print(df.head(50))
print(tabulate(df.head(50), showindex=False, headers=df.columns))
