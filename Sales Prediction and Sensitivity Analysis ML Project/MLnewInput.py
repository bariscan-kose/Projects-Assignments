
import pandas as pd
import numpy as np
import pyodbc

pd.set_option('display.max_rows', 500)
pd.set_option('display.max_columns', 500)
pd.set_option('display.width', 1000)

excelInfo=["Sky_High_2.xlsx"]
sqlFiles=["MainTable2"]
df=[]

for i in len(excelInfo):
    if i==0:
        df.append(pd.read_excel(r'C:\Users\hp\Desktop\Work\Correlation of Sales Metrics ML Project\SaldosData\{}'.format(excelInfo[i]),sheet_name="Sheet1"))
        df.append(pd.read_excel(r'C:\Users\hp\Desktop\Work\Correlation of Sales Metrics ML Project\SaldosData\{}'.format(excelInfo[i]),sheet_name="Sheet2"))
df[0] = df[0].loc[:, ~df.columns.str.contains('^Unnamed')]

for i in range(len(excelInfo)):
    df[i].columns = [c.replace(' ', '_') for c in df[i].columns]
    df[i].columns = [c.replace('[', '_') for c in df[i].columns]
    df[i].columns = [c.replace(']', '_') for c in df[i].columns]
    df[i].columns = [c.replace('/', '_') for c in df[i].columns]
    df[i].columns = [c.replace('#', '_') for c in df[i].columns]
    df[i].columns = [c.replace('(', '_') for c in df[i].columns]
    df[i].columns = [c.replace(')', '_') for c in df[i].columns]
    df[i].columns = [c.replace('-', '_') for c in df[i].columns]
    df[i].columns = [c.replace('\'', '_') for c in df[i].columns]
    df[i].columns = [c.replace('_', '') for c in df[i].columns]


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
df[0]["ProductName"]=""
df[0]["Barcode"]=""
df[0]["ContentId"]=""
df[0]["Seller"]=""
df[0]["VisualIntegrity"]=""
df[0]["BuyBox"]=""
df[0]["SalesPrice"]=""
df[0]["PSF"]=""
df[0]["DiscountRate"]=""
df[0]["PurchaseQuantity"]=""
df[0]["Keyword"]=""
df[0]["KeywordRank"]=""


server_name="LAPTOP-JU85A166"
database_name="ownDatabase"
conn = pyodbc.connect('Driver={SQL Server};Server='+server_name+'; Database='+database_name+';Trusted_Connection=yes;')
cursor = conn.cursor()


cursor.execute(f'CREATE TABLE MainTable2 ( Month nvarchar(50), Day int, Hour int, ProductName nvarchar(500), Barcode nvarchar(100), ContentId nvarchar(200), Seller nvarchar(200), VisualIntegrity nvarchar(200), BuyBox nvarchar(200), SalesPrice float(24), PSF float(24), DiscountRate float(24), PurchaseQuantity int, Visit int, Keyword nvarchar(200), KeywordRank int )') 

for i in range(len(excelInfo)):
    for row in df[i].itertuples():
        if(i==0):
            cursor.execute(f'INSERT INTO {database_name}.dbo.{sqlFiles[i]} (Month,Day,Hour,ProductName,Barcode,ContentId,Seller,VisualIntegrity,BuyBox,SalesPrice,PSF,DiscountRate,PurchaseQuantity,Visit,Keyword,KeywordRank)VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)', 
        row.Month,
        row.Day,
        row.Hour,
        row.ProductName,
        row.Barcode,
        row.ContentId,
        row.Seller,
        row.VisualIntegrity,
        row.BuyBox,
        row.SalesPrice,
        row.PSF,
        row.DiscountRate,
        row.PurchaseQuantity,
        row.Visit,
        row.Keyword,
        row.KeywordRank
        )

#cursor.execute(f'INSERT INTO MainTable SELECT {sqlFiles[0]}.Month,{sqlFiles[0]}.Day,{sqlFiles[0]}.Hour,{sqlFiles[0]}.İsim, {sqlFiles[0]}.Barkod, {sqlFiles[1]}.ContentId, {sqlFiles[0]}.Saldos, {sqlFiles[2]}.SumOfCargoDesi, {sqlFiles[0]}.BuyBox_BuyBox_Base,{sqlFiles[0]}.SalesPrice_BuyBox_Base, {sqlFiles[0]}.PSF, {sqlFiles[0]}.DiscountRate,{sqlFiles[2]}.PurchQuantity, {sqlFiles[3]}.RealVisit, {sqlFiles[1]}.Keyword, {sqlFiles[1]}.Sira FROM {sqlFiles[0]} INNER JOIN {sqlFiles[1]} ON {sqlFiles[0]}.[Month]={sqlFiles[1]}.[Month] and {sqlFiles[0]}.[Day]={sqlFiles[1]}.[Day] and {sqlFiles[0]}.[Hour]={sqlFiles[1]}.[Hour] INNER JOIN dataOrders ON {sqlFiles[0]}.[Month]={sqlFiles[2]}.[Month] and {sqlFiles[0]}.[Day]={sqlFiles[2]}.[Day] and {sqlFiles[0]}.[Hour]={sqlFiles[2]}.[Hour] INNER JOIN dataVisitSales ON {sqlFiles[0]}.[Month]={sqlFiles[3]}.[Month] and {sqlFiles[0]}.[Day]={sqlFiles[3]}.[Day] and {sqlFiles[0]}.[Hour]={sqlFiles[3]}.[Hour]')

conn.commit()