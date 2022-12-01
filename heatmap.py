import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns



df = pd.read_csv('data.csv', index_col = 0)
df = pd.DataFrame({
'Age': [-2.122740466,	-1.667706821,	5.008766883,	-2.965530765,	-3.376016316,	0.52256088,	-0.378436436,	3.121747994,	0,	2.192881828,	5.30377246],
'Sex': [-3.272644054,	-0.198850859,	6.571731342,	-4.814644741,	0.718814927,	3.231634091,	-5.502502334,	-3.588257693,	-5.625449693,	-0.251028755,	-6.851520321],
'Alcohol':[-2.3892214,	0.126632651,	-3.570883896,	3.354245527,	-3.06819246,	1.980501594,	3.573889389,	-2.144526788,	-1.299373889,	0.646579545,	0],
'Smoking status':[-1.082821603,	-0.962028624,	-3.342260917,	-2.071787323,	-2.796671393,	-5.271845046,	3.213983879,	-1.531476371,	0.189950584,	2.368653693,	-5.150924634],
'Physical activity':[-2.254654559,	0.229413164,	-5.481588472,	3.611918413,	-1.611635496,	0.818457372,	1.410254999,	-2.0725428,	0,	0,	-0.263901544]
})

#df
#Age          Sex           Alcohol     smoking status  physical activity
#-2.122740466 -3.272644054 -2.3892214   -1.082821603    -2.254654559
#-1.667706821 -0.198850859  0.126632651 -0.962028624    0.229413164 
df.index=["Alanine aminotransferase","Alkaline phosphatase","Body mass index ","Cholesterol","Cystatin C",
         "FEV1/ FVC ratio Z-score","Height","Platelet count","Red blood cell count","Total protein level in blood","Triglycerides"]

#df
#                         Age          Sex           Alcohol     smoking status  physical activity
#Alanine aminotransferase -2.122740466 -3.272644054 -2.3892214   -1.082821603    -2.254654559
#Alkaline phosphatase     -1.667706821 -0.198850859  0.126632651 -0.962028624    0.229413164 


sns.heatmap(df,annot=False, cmap="RdBu")
#plt.rcParams["figure.figsize"] = [5,5]
plt.figure(dpi=1000)
plt.show()
#fig.set_size_inches(10, 10)
#plt.savefig('filename.png')


plt.show()
plt.rc('xtick',labelsize=5)
plt.rc('ytick',labelsize=5)
sns.heatmap(df, annot=True, fmt='d',cmap='YlGnBu')

plt.show()
plt.figure(figsize=(400, 400)) 

plt.rc('xtick', labelsize=40)

plt.rc('ytick', labelsize=40)
sns.heatmap(df, annot=True, fmt='d',cmap='YlGnBu')
