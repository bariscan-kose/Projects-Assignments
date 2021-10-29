
import pandas as pd
import numpy as np
import pyodbc

pd.set_option('display.max_rows', 500)
pd.set_option('display.max_columns', 500)
pd.set_option('display.width', 1000)

excelInfo=["dataBuybox.xlsx","dataKeywordRank.xlsx", "dataOrders.xlsx", "dataVisitSales.xlsx"]
sqlFiles=["dataBuyBox","dataKeywordRank","dataOrders","dataVisitSales"]
df=[]

for i in range(len(excelInfo)):
    df.append(pd.read_excel(r'C:\Users\hp\Desktop\Work\Correlation of Sales Metrics ML Project\SaldosData\{}'.format(excelInfo[i])))

def number_to_month(argument):
    switcher = {
        1: "January",
        2: "February",
        3: "March",
        4: "April",
        5: "May",
        6: "June",
        7: "July",
        8: "August",
        9: "September",
        10: "October",
        11: "November",
        12: "December"
    }
    return switcher.get(argument, "Invalid month")

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


df0DiscountArr=[]
for row in df[0].itertuples():
    theDiscount= (row.PSF - row.BuyBoxBaseSatisFiyati)/row.PSF
    df0DiscountArr.append(theDiscount)
df[0]["Discount"]=df0DiscountArr

df[1].ListDateQuarter = [c.replace('Qtr ', '') for c in df[1].ListDateQuarter]

df[2]["Siparişdurumu"]=df[2]["Siparişdurumu"].fillna(method="ffill")

yearArr=[]
monthArr=[]
dayArr=[]
hourArr=[]

for c in df[2]["OrderDateTime"]:
    splits=str(c).split()
    date=splits[0].split("-")
    hour=splits[1].split(":")
    hour=hour[0]
    hour=(int(hour)+3)%24
    day=date[2]
    month=date[1]
    year=date[0]
    yearArr.append(year)
    dayArr.append(day)
    hourArr.append(hour)
    monthArr.append(number_to_month(int(month)))

df[2]["ListYear"]=yearArr
df[2]["ListMonth"]=monthArr
df[2]["ListDay"]=dayArr
df[2]["ListHour"]=hourArr


df_copy=df[2].copy()
dateOrders=[]
quantityOrders=[]

for row in df[2].itertuples():
    orderQuantity = row.SumofQuantity
    orderDate = (row.ListYear,row.ListMonth,row.ListDay,row.ListHour)
    if orderDate not in dateOrders:
        dateOrders.append(orderDate)
        quantityOrders.append(orderQuantity)
    elif orderDate in dateOrders:
        indexOrder = dateOrders.index(orderDate)
        quantityOrders[indexOrder]=quantityOrders[indexOrder]+orderQuantity
quantityDateZip = zip(dateOrders,quantityOrders)
#print(len(list(quantityDateZip)))
dfQuantArr=[]
df_copy=df_copy.drop_duplicates(subset=["ListYear","ListMonth","ListDay","ListHour"])
df_copy["PurchQuantity"]=""

for row in df_copy.itertuples():
    orderDate2=(row.ListYear,row.ListMonth,row.ListDay,row.ListHour)
    for p,q in zip(dateOrders,quantityOrders):
        if p == orderDate2:
            dfQuantArr.append(q)
            
df_copy["PurchQuantity"]=dfQuantArr
#print(df_copy) 
df[2]=df_copy

df3=df[3].copy()
for i in range(23):
    df[3]= pd.concat([df[3], df3], ignore_index=True, sort=True)
df3VisitArr= []
df3YearArr=[]
df3HourArr=[]
df[3].sort_values(["ModelNumarasıRengi", 'TarihMonth', "TarihDay"], inplace=True )
df[3]["TarihHour"] = ""
df[3]["RealVisit"]= ""
df[3]["TarihYear"]= ""
df3=df[3].copy()

percentages = [0.05,0.028,0.013,0.007,0.004,0.003,0.004,0.01,0.021,0.036,0.046,0.054,0.059,0.062,0.06,0.058,0.056,0.054,0.051,0.052,0.058,0.066,0.077,0.073]
hourForPercentages=0
for row in df3.itertuples():
    df3VisitArr.append(row.Visit*percentages[hourForPercentages])
    df3HourArr.append(hourForPercentages)
    hourForPercentages= (hourForPercentages+1)%24
    df3YearArr.append(2021)
df3["RealVisit"]=df3VisitArr
df3["TarihHour"]=df3HourArr
df3["TarihYear"]=df3YearArr
#print(df3)
df[3]=df3

#print(df[0].columns,"\n",df[1].columns,"\n",df[2].columns,"\n",df[3].columns,"\n")


server_name="LAPTOP-JU85A166"
database_name="ownDatabase"
conn = pyodbc.connect('Driver={SQL Server};Server='+server_name+'; Database='+database_name+';Trusted_Connection=yes;')
cursor = conn.cursor()


""" for i in range(len(excelInfo)):
    if(i==0):
        cursor.execute(f'CREATE TABLE {sqlFiles[i]} (Barkod nvarchar(50),İsim nvarchar(500), BuyBox_BuyBox_Base nvarchar(100),PSF float(24),SalesPrice_BuyBox_Base float(24), SalesPrice_Saldos float(24),   Saldos nvarchar(100), SumOfNetSales int, Month nvarchar(200), Day int, Hour int, Marka nvarchar(100), SiteURL nvarchar(500), DiscountRate float(24) )')
    elif(i==1):
        cursor.execute(f'CREATE TABLE {sqlFiles[i]} (UrunAdi nvarchar(200), ContentId nvarchar(200), Barcode nvarchar(200), Price float(24), Keyword nvarchar(200), Sira int, Seller nvarchar(200), Year int, Quarter int , Month nvarchar(200), Day int, Hour int, SumOfNetSales int)')
    elif(i==2):
        cursor.execute(f'CREATE TABLE {sqlFiles[i]} (OrderDateTime nvarchar(200), ChannelId nvarchar(200), OrderNumber nvarchar(200), Barcode nvarchar(200), SingularProductCode nvarchar(200), SingularProductName nvarchar(500), PackageCode nvarchar(200), PackageProductName nvarchar(500), PlatformBarcode nvarchar(200),SumofQuantity int, SumOfPurchPrice int, SumOfPurchAmount int, SingularSalesPrice int, SumOfCommission int, SumOfNetAmount int, SumOfTaxAmount int, SumOfSellerDiscount int, SumOfSellerInvoiceAmount int, SumOfCargoPrice int, SumOfCargoDesi int, OrderStatus nvarchar(200), ShipmentCity nvarchar(200), Year int, Month nvarchar(200), Day int, Hour int, PurchQuantity int)')
    elif(i==3):
        cursor.execute(f'CREATE TABLE {sqlFiles[i]} (Year int, Month nvarchar(200), Day int, Hour int, RealVisit int, ConversionRate float(24), ModelId nvarchar(200),SumOfAverageTL float(24), SumOfGrossSaleAmount int,SumOfFavorites int,SumOfGrossRevenue float(24), Visit int,ProductName nvarchar(200))')
 """
# Insert DataFrame to Table

for i in range(len(excelInfo)):
    for row in df[i].itertuples():
        if(i==0):
            cursor.execute(f'INSERT INTO {database_name}.dbo.{sqlFiles[i]} (Barkod, İsim, BuyBox_BuyBox_Base, PSF, SalesPrice_BuyBox_Base,SalesPrice_Saldos,Saldos, SumOfNetSales, Month, Day, Hour, Marka, SiteURL, DiscountRate)VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)', 
        row.Barkod, 
        row.İsim , 
        row.BuyBoxBaseBuybox ,
        row.PSF, 
        row.BuyBoxBaseSatisFiyati,
        row.FiyatSaldos, 
        row.Saldos, 
        row.SumofNetSales, 
        row.TYDateMonth,
        row.TYDateDay,
        row.HourInfo,
        row.Marka, 
        row.SiteUrl,
        row.Discount
        )
        if(i==1):
            cursor.execute(f'INSERT INTO {database_name}.dbo.{sqlFiles[i]} (UrunAdi,ContentId,Barcode,Price,Keyword,Sira,Seller,Year,Quarter,Month,Day, Hour, SumOfNetSales)VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)' , 
        row.UrunAdi,
        row.ContentID,
        row.BarcodefromGDrive,
        row.Price,
        row.KeyWord, 
        row.Sira,
        row.Seller, 
        row.ListDateYear,
        row.ListDateQuarter,
        row.ListDateMonth,
        row.ListDateDay, 
        row.HourInfo,
        row.SumofNetSales
        )  
        if(i==2):
            cursor.execute(f'INSERT INTO {database_name}.dbo.{sqlFiles[i]} (OrderDateTime, ChannelId, OrderNumber, Barcode, SingularProductCode, SingularProductName, PackageCode, PackageProductName,PlatformBarcode,SumofQuantity, SumOfPurchPrice,  SumOfPurchAmount, SingularSalesPrice, SumOfCommission, SumOfNetAmount,SumOfTaxAmount,SumOfSellerDiscount,SumOfSellerInvoiceAmount, SumOfCargoPrice, SumOfCargoDesi,OrderStatus, ShipmentCity,Year, Month, Day, Hour, PurchQuantity) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)' , 
        row.OrderDateTime,
        row.ChannelId,
        row.OrderNumber, 
        row.Barcode, 
        row.TekilÜrünKodu,
        row.TekilÜrünAdı,
        row.PaketKodu, 
        row.PaketÜrünAdı, 
        row.PlatformBarkodu, 
        row.SumofQuantity, 
        row.SumofPurchPrice, 
        row.SumofPurchAmount, 
        row.tekilsatışfiyat, 
        row.SumofCommission, 
        row.SumofNetAmount, 
        row.SumofTaxAmount, 
        row.SumofSellerDiscount, 
        row.SumofSellerInvoiceAmount, 
        row.SumofCargoPrice, 
        row.SumofCargoDesi, 
        row.Siparişdurumu, 
        row.ShipCity,
        row.ListYear,
        row.ListMonth,
        row.ListDay,
        row.ListHour,
        row.PurchQuantity
        )  
        if(i==3):
            cursor.execute(f'INSERT INTO {database_name}.dbo.{sqlFiles[i]} (Year,Month,Day,Hour,RealVisit,ConversionRate,ModelId,SumOfAverageTL, SumOfGrossSaleAmount, SumOfFavorites,SumOfGrossRevenue, Visit,ProductName)VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)', 
        row.TarihYear,
        row.TarihMonth, 
        row.TarihDay,
        row.TarihHour,
        row.RealVisit,
        row.Conversion, 
        row.ModelNumarasıRengi,
        row.SumofAverageTL, 
        row.SumofBrütSatışAdedi,
        row.SumofFavoriSayısı, 
        row.SumofGMVBrütCiro,
        row.Visit, 
        row.ÜrünAdı, 
        )


#cursor.execute(f'CREATE TABLE MainTable ( Month nvarchar(50), Day int, Hour int, ProductName nvarchar(500), Barcode nvarchar(100), ContentId nvarchar(200), Seller nvarchar(200), VisualIntegrity nvarchar(200), BuyBox nvarchar(200), SalesPrice float(24), PSF float(24), DiscountRate float(24), PurchaseQuantity int, Visit int, Keyword nvarchar(200), KeywordRank int )') 

cursor.execute(f'INSERT INTO MainTable SELECT {sqlFiles[0]}.Month,{sqlFiles[0]}.Day,{sqlFiles[0]}.Hour,{sqlFiles[0]}.İsim, {sqlFiles[0]}.Barkod, {sqlFiles[1]}.ContentId, {sqlFiles[0]}.Saldos, {sqlFiles[2]}.SumOfCargoDesi, {sqlFiles[0]}.BuyBox_BuyBox_Base,{sqlFiles[0]}.SalesPrice_BuyBox_Base, {sqlFiles[0]}.PSF, {sqlFiles[0]}.DiscountRate,{sqlFiles[2]}.PurchQuantity, {sqlFiles[3]}.RealVisit, {sqlFiles[1]}.Keyword, {sqlFiles[1]}.Sira FROM {sqlFiles[0]} INNER JOIN {sqlFiles[1]} ON {sqlFiles[0]}.[Month]={sqlFiles[1]}.[Month] and {sqlFiles[0]}.[Day]={sqlFiles[1]}.[Day] and {sqlFiles[0]}.[Hour]={sqlFiles[1]}.[Hour] INNER JOIN dataOrders ON {sqlFiles[0]}.[Month]={sqlFiles[2]}.[Month] and {sqlFiles[0]}.[Day]={sqlFiles[2]}.[Day] and {sqlFiles[0]}.[Hour]={sqlFiles[2]}.[Hour] INNER JOIN dataVisitSales ON {sqlFiles[0]}.[Month]={sqlFiles[3]}.[Month] and {sqlFiles[0]}.[Day]={sqlFiles[3]}.[Day] and {sqlFiles[0]}.[Hour]={sqlFiles[3]}.[Hour]')

conn.commit()