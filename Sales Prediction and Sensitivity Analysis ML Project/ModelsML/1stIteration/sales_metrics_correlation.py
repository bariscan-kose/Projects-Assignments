import pyodbc 
import pandas as pd
import numpy as np

server_name="VM01"
database_name="SALDOSReporting"
table_name=["dbo.BuyBox_Base","dbo.KeyWordSearch"]

conn = pyodbc.connect('Driver={SQL Server};Server='+server_name+'; Database='+database_name+';Trusted_Connection=yes;')

cursor = conn.cursor()

sql_query=[]
sql_query.append(pd.read_sql_query('SELECT TOP 3000000 * FROM {}.{}'.format(database_name,table_name[0]),conn))
sql_query.append(pd.read_sql_query('SELECT TOP 10 * FROM {}.{}'.format(database_name,table_name[1]),conn))

sql_query[0].drop(["Vendor","Barkod","SiteUrl","InsertDate","Period","Firma","Marka"], axis='columns', inplace=True)
sql_query[0]["BuyBox"] =  (sql_query[0]["AnaSatici"]==sql_query[0]["Seller"])
sql_query[0]["BuyBox"] = sql_query[0]["BuyBox"].astype(int)
sql_query[0]["Discount"] = ((sql_query[0]["PSF"]-sql_query[0]["LTFiyati"])/sql_query[0]["PSF"])
sql_query[1].drop(["ListDate","InsertDate"], axis='columns', inplace=True)
corr_features=["Sira","SatisFiyati","Visit","BuyBox","Discount"]
cr=[]

for feature in corr_features:
    cr.append(sql_query[0][feature].corr(sql_query[0]["Sales"], method="pearson"))

""" sql_numpy=[]
sql_numpy.append(sql_query[0]["Visit"].to_numpy())
sql_numpy.append(sql_query[0]["Sales"].to_numpy())

r=np.corrcoef(sql_numpy[0],sql_numpy[1]) """

print("Sıra : {} \nSatış Fiyatı : {} \nVisit : {} \nBuyBox : {} \nDiscount : {}\n".format(cr[0],cr[1],cr[2],cr[3],cr[4]))
