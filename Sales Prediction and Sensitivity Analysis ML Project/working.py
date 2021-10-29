import pandas as pd

s1 = pd.Series(['a', 'b'])
s2 = pd.Series(['c', 'd'])
s4= pd.concat([s1,s2])
for i in range(1):
    s3=pd.concat([s1, s2])
    s4=pd.concat([s4,s3])

print(s4)