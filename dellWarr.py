from bs4 import BeautifulSoup
import re
import pandas as pd
from pandas import ExcelWriter
from pandas import ExcelFile
from tabulate import tabulate
import os
import time
import requests
import openpyxl
from datetime import datetime

df = pd.read_excel('spares.xlsx', sheet_name='Sheet1')
writer = pd.ExcelWriter('spares.xlsx', engine='openpyxl', date='mm/dd/yyyy', mode='a')

shipDateUrl = "https://www.dell.com/support/components/dashboard/us/en/04/Warranty/GetWarrantyDetails"
deviceNameUrl = "https://www.dell.com/support/home/us/en/04/product-support/servicetag/9ybvsy1/events"

i = 0

modelNames = []
shipDates = []
dataToWrite = {}

for serialNum in df['Serial Number']:
    r = requests.post(shipDateUrl, data=dict(
        serviceTag=serialNum,
        isSerializedProduct=False
    ))
    
    if r.status_code == 200:
        soup = BeautifulSoup(r.text, "html.parser")
        tds = soup.find_all("td")
        shipDate = ""
        for dataCell in tds:
            data = str(dataCell.text.strip())
            index = data.find("Ship Date")
            if index != -1:
                shipDate = data[(data.find(": ") + 2):]
                shipDate = datetime.strptime(shipDate, '%d %b %Y').date()
                shipDate = datetime.strftime(shipDate, '%m/%d/%y')
        shipDates.insert(i, shipDate)
    else:
        shipDates.insert(i, "")
    
    # get name of device
    r = requests.post("https://www.dell.com/support/home/us/en/04/product-support/servicetag/{}/events".format(serialNum))
    if r.status_code == 200:
        try:
            soup = BeautifulSoup(r.text, "html.parser")
            h1 = soup.find("h1")
            h1 = str(h1.text.strip())
            h1 = h1[h1.index("Support for") + len("Support for") + 1:].split('\n')[0]
            modelNames.insert(i, h1)
        except:
            modelNames.insert(i, "")
    else:
        modelNames.insert(i, "")

    i += 1

for row in df:
    if row == 'Serial Number':
        df[row] = [x.upper() for x in df[row]]
    dataToWrite.update({row : df[row]})
dataToWrite.update( {'Ship Date' : (shipDates)} )
dataToWrite.update({'Model' : modelNames})

writeData = pd.DataFrame(dataToWrite)
writeData.to_excel(writer, sheet_name='updated')
writer.save()
writer.close()
