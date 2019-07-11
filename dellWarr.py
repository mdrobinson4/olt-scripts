from bs4 import BeautifulSoup
import re
import pandas as pd
from pandas import ExcelWriter
from pandas import ExcelFile
from tabulate import tabulate
import os
import time

df = pd.read_excel('Info For Asset Panda.xlsx', sheetname='Sheet1')

serialNums = df['Serial #']
print(serialNum)

for serialNum in serialNums:


r = requests.post("http://example.com/page", data=dict(
    email="me@domain.com",
    password="secret_value"
))
