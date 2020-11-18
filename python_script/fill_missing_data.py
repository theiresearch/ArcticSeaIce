# import libraries
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# read csv into pandas' dataframe
CSV_DATA = pd.read_csv('ori.csv', names=["YEAR", "VALUE"])
CSV_DATA_drop = CSV_DATA.drop([0])
print(CSV_DATA_drop)

# store column items in lists¶
CSV_YEAR = [int(item) for item in CSV_DATA_drop.YEAR.to_list()]
#print(CSV_YEAR)
CSV_VALUE = [float(item) for item in CSV_DATA_drop.VALUE.to_list()]
#print(CSV_VALUE)

# nominalization (let value[0] = 0)
print("CSV_YEAR = ", CSV_YEAR)
print("\n")
NOMINAL_VALUE = [round(item-CSV_VALUE[0], 2) for item in CSV_VALUE]
print("NOMINAL_VALUE = ", NOMINAL_VALUE)

# create new lists for final data sets
Year = []
Month = []
Year_Month = []
Value = []

# fill in missing data
i = 0
j = [i for i in np.arange(1, 469, 1)] # 468 = (2019-1980)*12; why add 1?: np.arange(1, 3, 1) => 1,2
for year in CSV_YEAR:
	if year >= CSV_YEAR[0] and year <= CSV_YEAR[-2]: # year: 1980-2018(here)
		i += 1
		value_init1 = NOMINAL_VALUE[i-1]
		value_init2 = NOMINAL_VALUE[i]
		value_difference = (value_init2 - value_init1)
		unit_difference = round(value_difference/12,3)
		print("Year", str(year), "~", str(year+1), ":")
		print(str(value_init1), "=>", str(value_init2), "(nominalized) ;")
		print("Total difference:", str(value_difference), ";")
		print("Twelve months' average difference:", str(unit_difference), ". \n")
		for month in np.arange(1, 13, 1): # month: 1~12
			Year.append(year) # year: 1980-2018(here)
			Month.append(int(month))
			Year_Month.append(str(year)+"-"+str(month)+"-01")
			if month == 1:
				Value.append(value_init1)
			elif month >= 2 and month <= 12:
				append_value = round(value_init1 + unit_difference*(month-1), 3)
				Value.append(append_value)
				
#print(Year)
#print(Month)
print(Year_Month)
print(Value)

#print(len(Year))
#print(len(Month))
#print(len(Value))

plt.figure(figsize=(20,10))
plt.plot(j, Value)


# export to a new csv
df = pd.DataFrame.from_dict({'Year':Year, 'Month':Month, 'Year-Month':Year_Month, 'Value': Value})
df.to_csv('tidy_Value.csv', header=True, index=False)