
import pandas as pd
import numpy as np
import pyodbc

pd.set_option('display.max_rows', 500)
pd.set_option('display.max_columns', 500)
pd.set_option('display.width', 1000)

excelInfo=["Sky_High_2.xlsx"]
sqlFiles=["MainTable2"] 
df=[]

df.append(pd.read_excel(r'C:\Users\hp\Desktop\Work\Correlation of Sales Metrics ML Project\SaldosData\{}'.format(excelInfo[0]),sheet_name="Sheet1")) #Visit
df.append(pd.read_excel(r'C:\Users\hp\Desktop\Work\Correlation of Sales Metrics ML Project\SaldosData\{}'.format(excelInfo[0]),sheet_name="Sheet2")) #SalesPrice, Hour
df[0] = df[0].loc[:, ~df[0].columns.str.contains('^Unnamed')]
df[1] = df[1].loc[:, ~df[1].columns.str.contains('^Unnamed')]

for i in range(len(df)):
    df[i].columns = [c.replace(' ', '_') for c in df[i].columns]
    df[i].columns = [c.replace('[', '_') for c in df[i].columns]
    df[i].columns = [c.replace(']', '_') for c in df[i].columns]
    df[i].columns = [c.replace('/', '_') for c in df[i].columns]
    df[i].columns = [c.replace('#', '_') for c in df[i].columns]
    df[i].columns = [c.replace('(', '_') for c in df[i].columns]
    df[i].columns = [c.replace(')', '_') for c in df[i].columns]
    df[i].columns = [c.replace('-', '_') for c in df[i].columns]
    df[i].columns = [c.replace('\'', '_')for c in df[i].columns]
    df[i].columns = [c.replace('_', '')  for c in df[i].columns]


df0=df[0].copy()
percentages = [0.05,0.028,0.013,0.007,0.004,0.003,0.004,0.01,0.021,0.036,0.046,0.054,0.059,0.062,0.06,0.058,0.056,0.054,0.051,0.052,0.058,0.066,0.077,0.073]
for i in range(23):
    df[0]= pd.concat([df[0], df0], ignore_index=True, sort=True)

df0VisitArr=[]
df0HourArr=[]
hourForPercentages=0

for row in df[0].itertuples():
    df0VisitArr.append(row.Visit*percentages[hourForPercentages])
    df0HourArr.append(hourForPercentages)
    hourForPercentages= (hourForPercentages+1)%24
    
df[0]["RealVisit"]=df0VisitArr
df[0]["Hour"]=df0HourArr
df[0]["Visit"]=df[0]["RealVisit"]
df[0].drop(["RealVisit"], axis='columns', inplace=True)

df[1]["Month"]=df[1]["TYDateMonth"]
df[1]["Day"]=df[1]["TYDateDay"]
df[1]["Hour"]=df[1]["HourInfo"]
df[1].drop(["TYDateMonth","TYDateDay","HourInfo"], axis="columns", inplace=True)
""" 
df0DateArr=[]
df1DateArr=[]
for row in df[0].itertuples():
    df0DateArr.append(f"{row.Hour}/{row.Day}/{row.Month}")
for row in df[1].itertuples():
    df1DateArr.append(f"{row.Hour}/{row.Day}/{row.Month}")
df[0]["Date"]=df0DateArr
df[1]["Date"]=df1DateArr
 """

print("df0 columns:", df[0].columns, "\ndf1 columns:", df[1].columns)
df2=df[0].merge(df[1], left_on=["Month","Day","Hour"],right_on=["Month","Day","Hour"],how="inner")
df.append(df2)

df[2]["ContentId"]=""
df[2]["VisualIntegrity"]=""
df[2]["Keyword"]=""
df[2]["KeywordRank"]=""
df2DiscountArr=[]
for row in df[2].itertuples():
    theDiscount= (row.PSF - row.FiyatSaldos)/row.PSF
    df2DiscountArr.append(theDiscount)
df[2]["Discount"]=df2DiscountArr
df[2].drop(["BuyBoxBaseSatisFiyati"], axis="columns", inplace=True)

print(df[2].columns,"\n")

server_name="LAPTOP-JU85A166"
database_name="ownDatabase"
conn = pyodbc.connect('Driver={SQL Server};Server='+server_name+'; Database='+database_name+';Trusted_Connection=yes;')
cursor = conn.cursor()


cursor.execute(f'CREATE TABLE {sqlFiles[0]} ( Month nvarchar(50), Day int, Hour int, ProductName nvarchar(500), Barcode nvarchar(100), ContentId nvarchar(200), Seller nvarchar(200), VisualIntegrity nvarchar(200), BuyBox nvarchar(200), SalesPrice float(24), PSF float(24), DiscountRate float(24), PurchaseQuantity int, Visit int, Keyword nvarchar(200), KeywordRank int )') 

for row in df[2].itertuples():
    cursor.execute(f'INSERT INTO {database_name}.dbo.{sqlFiles[0]} (Month,Day,Hour,ProductName,Barcode,ContentId,Seller,VisualIntegrity,BuyBox,SalesPrice,PSF,DiscountRate,PurchaseQuantity,Visit,Keyword,KeywordRank)VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)', 
        row.Month,
        row.Day,
        row.Hour,
        row.İsim,
        row.Barkod,
        row.ContentId,
        row.Saldos,
        row.VisualIntegrity,
        row.BuyBoxBaseBuybox,
        row.FiyatSaldos,
        row.PSF,
        row.Discount,
        row.SumofNetSales,
        row.Visit,
        row.Keyword,
        row.KeywordRank
        )

conn.commit()   