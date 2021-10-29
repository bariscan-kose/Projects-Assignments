import pyodbc 
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
from tensorflow.keras.layers.experimental import preprocessing

pd.set_option("display.max_rows",None,"display.max_columns", None)

server_name="LAPTOP-JU85A166"
database_name="SALDOSReporting"
table_name=["dbo.BuyBox_Base","dbo.KeyWordSearch"]
conn = pyodbc.connect('Driver={SQL Server};Server='+server_name+'; Database='+database_name+';Trusted_Connection=yes;')
cursor = conn.cursor()

sql_query=[]
sql_query.append(pd.read_sql_query('SELECT TOP 1000000 * FROM {}.{}'.format(database_name,table_name[0]),conn))
#sql_query.append(pd.read_sql_query('SELECT TOP 10 * FROM {}.{}'.format(database_name,table_name[1]),conn))

sql_query[0].drop_duplicates(subset="Barkod", inplace= True)
sql_query[0].replace([np.inf,-np.inf],np.nan,inplace=True)
sql_query[0].dropna(how="any",inplace=True) 

print(sql_query[0].tail())

sql_query[0]["BuyBox"] =  (sql_query[0]["AnaSatici"]==sql_query[0]["Seller"])
sql_query[0]["BuyBox"] = sql_query[0]["BuyBox"].astype(int)
sql_query[0]["BuyBox"] = sql_query[0]["BuyBox"].map({0:"NOT BuyBox", 1:"BuyBox"})
sql_query[0] = pd.get_dummies(sql_query[0], columns = ["BuyBox"] , prefix="", prefix_sep="")

sql_query[0]["Discount"] = ((sql_query[0]["PSF"]-sql_query[0]["SatisFiyati"])/sql_query[0]["PSF"])

sql_query[0]=sql_query[0][sql_query[0]["PSF"] > 2]
sql_query[0]=sql_query[0][sql_query[0]["Discount"]<1.01]

#sql_query[0]=sql_query[0].loc[(sql_query[0]["BuyBox"]=="NOT BuyBox")]

sql_query[0].drop(["Vendor","SiteUrl","Firma","Marka","UrunAdi", "ID","Period", "InsertDate","Barkod","Seller","AnaSatici","PSF","LTFiyati"], axis='columns', inplace=True)

corr_features=["Sira","SatisFiyati","Visit","BuyBox","Discount"]

#sql_query[0]["Barkod"]=pd.to_numeric(sql_query[0]["Barkod"],errors="coerce")
#print(sql_query[0].isna().sum())

train_dataset = sql_query[0].sample(frac=0.8, random_state=0)
test_dataset = sql_query[0].drop(train_dataset.index)

#sns.pairplot(train_dataset[["Sales","Visit","Discount","SatisFiyati"]], diag_kind="kde")
#train_dataset.describe().transpose()

train_features = train_dataset.copy()
test_features = test_dataset.copy()

train_labels = train_features.pop('Sales')
test_labels = test_features.pop('Sales')

test_results={}

""" 
#SINGLE INPUT LINEAR REGRESSION
visits = np.array(train_features["Visit"])
visits_normalizer=preprocessing.Normalization(input_shape=[1,],axis=None)
visits_normalizer.adapt(visits) 

visits_model=tf.keras.Sequential([visits_normalizer,layers.Dense(units=1)])
visits_model.summary()

training_history=visits_model.fit(train_features["Visit"],train_labels,epochs=100,verbose=0,validation_split=0.1)
training_hist_df=pd.DataFrame(training_history.history)
training_hist_df["epoch"]=training_history.epoch
print(training_hist_df.tail())

test_results={}
test_results["visits_model"] = visits_model.evaluate(test_features["Visit"],test_labels, verbose=0)
"""

#MULTIPLE INPUT LINEAR REGRESSION
normalizer = preprocessing.Normalization(axis=-1)
normalizer.adapt(np.array(train_features))

"""
print(normalizer.mean.numpy())
first = np.array(train_features[:1])

with np.printoptions(precision=2, suppress=True):
  print('First example:', first)
  print()
  print('Normalized:', normalizer(first).numpy()) 
"""

def build_and_compile(norm):
    model= keras.Sequential([norm,layers.Dense(64,activation="relu"),layers.Dense(64,activation="relu"),layers.Dense(1)])
    model.compile(loss="mean_absolute_error",optimizer=tf.keras.optimizers.Adam(0.01))
    return model

dnn_model= build_and_compile(normalizer)
dnn_model.summary()

dnn_history=dnn_model.fit(train_features,train_labels,epochs=10,verbose=0,validation_split=0.1)
dnn_history_df=pd.DataFrame(dnn_history.history)
dnn_history_df["epoch"] = dnn_history.epoch
print(dnn_history_df.tail())

test_results["dnn_model"] = dnn_model.evaluate(test_features,test_labels,verbose=0)
pd.DataFrame(test_results, index=["Mean absolute error [Sales]"])
print(test_results)

wt_names = dnn_model.get_variable_names() 
wt_vals = [dnn_model.get_variable_value(name) for name in wt_names]
print(wt_names)
print(wt_vals)
""" 
linear_model=tf.keras.Sequential([normalizer,layers.Dense(units=1)])
linear_model.summary()

linear_model.predict(train_features[:10])
linear_model.compile(optimizer=tf.optimizers.Adam(learning_rate=0.01),loss="mean_absolute_error")

training_history_linear=linear_model.fit(train_features,train_labels,epochs=100,verbose=0,validation_split=0.1)
training_hist_linear_df=pd.DataFrame(training_history_linear.history)
training_hist_linear_df["epoch"]=training_history_linear.epoch
print(training_hist_linear_df.tail()) 

test_results["linear_model"] = linear_model.evaluate(test_features,test_labels, verbose=0)
print(test_results)

x=tf.linspace(0.0,1000000,200)
y=visits_model.predict(x)
y=linear_model.predict(x)


def plot_visits(x,y):
    plt.scatter(train_features,train_labels,label="Data")
    #plt.scatter(train_features["Visit"],train_labels,label="Data")
    plt.plot(x,y,color="k",label="Predictions")
    plt.xlabel("Data")
    #plt.xlabel("Visit")
    plt.ylabel("Sales")
    plt.legend()

plot_visits(x,y)
plt.show() """

test_predictions= dnn_model.predict(test_features).flatten()

a=plt.axes(aspect="equal")
plt.scatter(test_labels, test_predictions)
plt.xlabel("True Values [Sales]")
plt.ylabel("Predictions [Sales]")
lims=[0,7000]
plt.xlim(lims)
plt.ylim(lims)
plt.plot(test_labels, test_labels, color="r")
plt.show()
