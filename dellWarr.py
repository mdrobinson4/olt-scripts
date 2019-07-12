from bs4 import BeautifulSoup
import re
import pandas as pd
from pandas import ExcelWriter
from pandas import ExcelFile
from tabulate import tabulate
import os
import time
import requests

df = pd.read_excel('spares.xlsx', sheetname='Sheet1')
shipDateUrl = "https://www.dell.com/support/components/dashboard/us/en/04/Warranty/GetWarrantyDetails"
deviceNameUrl = "https://www.dell.com/support/home/us/en/04/product-support/servicetag/9ybvsy1/events"

serialNums = df['Serial Number']
print(serialNums)

for serialNum in serialNums:
    r = requests.post(shipDateUrl, data=dict(
        serviceTag=serialNum,
        isSerializedProduct=False
    ))
    
    print(r.text)
    
    #r1 = requests.post(shipDateUrl)
    #print(r1.text)
    time.sleep(1)
