import pyodbc 
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
from tensorflow.keras.layers.experimental import preprocessing
from tensorflow.python.keras.backend import dtype
from tensorflow.python.ops.gen_array_ops import shape
import seaborn as sns
#import shap

pd.set_option("display.max_rows",None,"display.max_columns", None)

server_name="LAPTOP-JU85A166"
database_name="ownDatabase"
table_name=["MainTable2","dbo.CheckImageResults"]
conn = pyodbc.connect('Driver={SQL Server};Server='+server_name+'; Database='+database_name+';Trusted_Connection=yes;')
cursor = conn.cursor() 

sql_query=[]
sql_query.append(pd.read_sql_query('SELECT TOP 3000000 * FROM {}.dbo.{}'.format(database_name,table_name[0]),conn))
#sql_query.append(pd.read_sql_query('SELECT TOP 100 * FROM {}.{}'.format(database_name,table_name[1]),conn))


drop_features=["Month","Day","ProductName","Barcode","ContentId","Seller","VisualIntegrity","PSF","DiscountRate","Keyword","KeywordRank"]

sql_query[0].drop(drop_features, axis='columns', inplace=True)
corr_features=["BuyBox","SalesPrice","PurchaseQuantity","Hour","Visit",]

df=pd.read_excel(r'C:\Users\hp\Desktop\Work\Correlation of Sales Metrics ML Project\SaldosData\Sky_Deneme.xlsx')
df = df.loc[:, ~df.columns.str.contains('^Unnamed')]

print(df)

train_dataset = sql_query[0].sample(frac=0.8, random_state=0)
test_dataset = sql_query[0].drop(train_dataset.index)

test_results={} 

#sns.pairplot(train_dataset[["Sales","Visit","Discount","SatisFiyati"]], diag_kind="kde")
#train_dataset.describe().transpose()

train_features = train_dataset.copy()
test_features = test_dataset.copy()

buybox_train_feature=train_features.pop("BuyBox")
buybox_test_feature=test_features.pop("BuyBox")

#train_features=tf.keras.utils.normalize(train_features, axis=0, order=2)
train_features = pd.concat([train_features, buybox_train_feature], axis=1, join='inner')

#test_features=tf.keras.utils.normalize(test_features, axis=0, order=2)
test_features = pd.concat([test_features, buybox_test_feature], axis=1, join='inner')
#print(train_features)
train_labels = train_features.pop('PurchaseQuantity')
test_labels = test_features.pop('PurchaseQuantity')


CATEGORICAL_COLUMNS = ["BuyBox","Hour"]
NUMERIC_COLUMNS = ["SalesPrice","Visit"]
feature_columns=[]

for feature_name in CATEGORICAL_COLUMNS:
  vocabulary = train_features[feature_name].unique()
  categorical_column = tf.feature_column.categorical_column_with_vocabulary_list(feature_name, vocabulary)
  indicator_column = tf.feature_column.indicator_column(categorical_column)
  feature_columns.append(indicator_column)

for feature_name in NUMERIC_COLUMNS:
  feature_columns.append(tf.feature_column.numeric_column(feature_name, dtype=tf.float32)) 


def make_input_fn(data_df, label_df, num_epochs=500, shuffle=True, batch_size=32):
  def input_function():
    ds = tf.data.Dataset.from_tensor_slices((dict(data_df), label_df))
    if shuffle:
      ds = ds.shuffle(1000)
    ds = ds.batch(batch_size).repeat(num_epochs)
    return ds
  return input_function

train_input_fn = make_input_fn(train_features, train_labels)
eval_input_fn = make_input_fn(test_features, test_labels, num_epochs=1, shuffle=False)
predict_input_fn=tf.compat.v1.estimator.inputs.pandas_input_fn( x=df, num_epochs=1, shuffle=False)

n_batches=1
linear_est = tf.estimator.BoostedTreesRegressor(feature_columns=feature_columns, n_batches_per_layer=n_batches, center_bias= True)
linear_est.train(train_input_fn, max_steps=100)
result = linear_est.evaluate(eval_input_fn)

print("\n",result,"\n")

fig, axes = plt.subplots(2,2, figsize=(16,12))


test_predictions_Arr=[]
for pred in linear_est.predict(eval_input_fn):
  for key, value in pred.items():
    test_predictions_Arr.append(value[0])
print(len(test_labels), "\n", len(test_predictions_Arr))
axes[0,1].scatter(test_labels, test_predictions_Arr)
axes[0,1].set_xlabel("True Values [Sales]")
axes[0,1].set_ylabel("Predictions [Sales]") 
axes[0,1].plot(test_labels, test_labels, color="r")

#print(test_predictions_Arr)
#print(test_labels)



importance={}
wt_names = linear_est.get_variable_names() 
#print(wt_names)
wt_vals = [linear_est.get_variable_value(name) for name in wt_names]
a_zip=zip(wt_names,wt_vals)
a_list=list(a_zip)
print(a_list,"\n") 


pred_dicts = list(linear_est.experimental_predict_with_explanations(eval_input_fn))
labels = test_labels.values
#print(pred_dicts)
preds = pd.Series([pred['predictions'][0] for pred in pred_dicts])
df_dfc = pd.DataFrame([pred['dfc'] for pred in pred_dicts])
print(df_dfc)
print("\n",df_dfc.shape)


bias = pred_dicts[0]['bias']
dfc_pred = df_dfc.sum(axis=1) + bias
np.testing.assert_almost_equal(dfc_pred.values, preds.values)


ID = 32 
sns_colors=sns.color_palette("colorblind")


def _add_feature_values(feature_values, ax):
    x_coord = ax.get_xlim()[0]
    OFFSET = 0.15
    for y_coord, (feat_name, feat_val) in enumerate(feature_values.items()):
        t = plt.text(x_coord, y_coord - OFFSET, '{}'.format(feat_val), size=12)
        t.set_bbox(dict(facecolor='white', alpha=0.5))
    from matplotlib.font_manager import FontProperties
    font = FontProperties()
    font.set_weight('bold')
    t = plt.text(x_coord, y_coord + 3 - OFFSET, 'feature\nvalue',
    fontproperties=font, size=10)

# Boilerplate plotting code.
def dist_violin_plot(df_dfc, ID):
  # Initialize plot.
  #fig, ax = plt.subplots(1, 1, figsize=(10, 6))

  # Create example dataframe.
  TOP_N = 3  # View top 8 features.
  example = df_dfc.iloc[ID]
  ix = example.abs().sort_values()[-TOP_N:].index
  sorted_ix = example.abs().sort_values()[-TOP_N:].index
  example = example[ix]
  example_df = example.to_frame(name='dfc')

  # Add contributions of entire distribution.
  parts=axes[0,0].violinplot([df_dfc[w] for w in ix], vert=False, showextrema=False, widths=0.7, positions=np.arange(len(ix)))
  face_color = sns_colors[0]
  alpha = 0.15
  for pc in parts['bodies']:
      pc.set_facecolor(face_color)
      pc.set_alpha(alpha)

  # Add feature values.
  _add_feature_values(test_features.iloc[ID][sorted_ix], axes[0,0])

  # Add local contributions.
  axes[0,0].scatter(example,
              np.arange(example.shape[0]),
              color=sns.color_palette()[2],
              s=100,
              marker="s",
              label='contributions for example')

  # Legend
  # Proxy plot, to show violinplot dist on legend.
  axes[0,0].plot([0,0], [1,1], label='eval set contributions\ndistributions', color=face_color, alpha=alpha, linewidth=10)
  legend = axes[0,0].legend(loc='lower right', shadow=True, fontsize='x-large', frameon=True)
  legend.get_frame().set_facecolor('white')

  # Format plot.
  axes[0,0].set_yticks(np.arange(example.shape[0]))
  axes[0,0].set_yticklabels(example.index)
  axes[0,0].grid(False, axis='y')
  axes[0,0].set_xlabel('Contribution to predicted value', size=14) 

dist_violin_plot(df_dfc, ID)
axes[0,0].set_title('Feature contributions for example {}\n pred: {:1.2f}; label: {}'.format(ID, preds[ID], labels[ID]))


importances = linear_est.experimental_feature_importances(normalize=True)
df_imp = pd.Series(importances)

# Visualize importances.
N = 3
axes[1,1]= (df_imp.iloc[0:N][::-1]
    .plot(kind='barh',
          color=sns_colors[0],
          title='Gain feature importances',
          figsize=(10, 6)))
axes[1,1].grid(False, axis='y')


predictions_arr=[]
test_predictions= linear_est.predict(predict_input_fn)
for i in test_predictions:
  predictions_arr.append(i["predictions"][0])


x=tf.linspace(0,120,120)
print("length of x ", len(x))
y=predictions_arr
print("length of y",len(predictions_arr))


def plot_visits(x,y):
    axes[1,0].plot(x,y,color="k",label="Predictions")
    axes[1,0].set_xlabel("SalesPrice")
    #plt.xlabel("Visit")
    axes[1,0].set_ylabel("Sales")
    axes[1,0].legend()

plot_visits(x,y)

plt.show()

""" 
row_to_show = 5
shapData = train_features.iloc[row_to_show]
explainer = shap.KernelExplainer(linear_est, data=train_features)
shap_values = explainer.shap_values(shapData)

shap.initjs()
shap.force_plot(explainer.expected_value[1], shap_values[1], shapData) 
"""

"""
for info in a_list:
  for feature in corr_features:
    heading="linear/linear_model/"+feature+"/weights"
    if info[0]==heading:
      #print(feature, info[1][0])
      importance[feature]=info[1][0][0]
print(importance,"\n")
sns.barplot(list(importance.keys()), list(importance.values()))
"""

""" 
def get_normalization_parameters(traindf, features):
      def _z_score_params(column):
        mean = traindf[column].mean()
        std = traindf[column].std()
        return {'mean': mean, 'std': std}

    normalization_parameters = {}
    for column in features:
        normalization_parameters[column] = _z_score_params(column)
    return normalization_parameters

normalization_parameters = get_normalization_parameters(train_features, NUMERIC_COLUMNS)

feature_columns = []

def _numeric_column_normalized(column_name, normalizer_fn):
    return tf.feature_column.numeric_column(column_name, normalizer_fn=normalizer_fn)

def _make_zscaler(mean, std):
    def zscaler(col):
        return (col - mean)/std
    return zscaler

# Define your feature columns
def create_feature_cols(features, use_normalization):
    def normalize_column(col):  # Use mean, std defined below.
        return (col - mean)/std
    normalized_feature_columns = []
    for column_name in features:
        normalizer_fn = None
        if use_normalization:
            column_params = normalization_parameters[column_name]
            mean = column_params['mean']
            std = column_params['std']
            normalizer_fn = _make_zscaler(mean, std)
        normalized_feature_columns.append(_numeric_column_normalized(column_name,normalizer_fn))
    return normalized_feature_columns

feature_columns = create_feature_cols(NUMERIC_COLUMNS, use_normalization=True) 

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

"""
#MULTIPLE INPUT LINEAR REGRESSION
normalizer = preprocessing.Normalization(axis=-1)
normalizer.adapt(np.array(train_features))

print(normalizer.mean.numpy())
first = np.array(train_features[:1])

with np.printoptions(precision=2, suppress=True):
  print('First example:', first)
  print()
  print('Normalized:', normalizer(first).numpy()) 
 
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

""" 
def build_and_compile(norm):
    model= keras.Sequential([norm,layers.Dense(64,activation="relu"),layers.Dense(64,activation="relu"),layers.Dense(1)])
    model.compile(loss="mean_absolute_error",optimizer=tf.keras.optimizers.Adam(0.01))
    return model

dnn_model= build_and_compile(normalizer)
dnn_model.summary()

dnn_history=dnn_model.fit(train_features,train_labels,epochs=100,verbose=0,validation_split=0.1)
dnn_history_df=pd.DataFrame(dnn_history.history)
dnn_history_df["epoch"] = dnn_history.epoch
print(dnn_history_df.tail())

test_results["dnn_model"] = dnn_model.evaluate(test_features,test_labels,verbose=0)
pd.DataFrame(test_results, index=["Mean absolute error [Sales]"])
print(test_results)

test_predictions= dnn_model.predict(test_features).flatten()

a=plt.axes(aspect="equal")
plt.scatter(test_labels, test_predictions)
plt.xlabel("True Values [Sales]")
plt.ylabel("Predictions [Sales]")
lims=[0,7000]
plt.xlim(lims)
plt.ylim(lims)
plt.plot(test_labels, test_labels, color="r")
plt.show() """
