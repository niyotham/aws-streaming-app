# aws-streaming-app
A Scalable #aws streaming Application for real time reporting.
To do:
1. send data to redshift
2. create a lambda function to load data into s3 or Readshift
3. read data into a csv
4. do visualization

# python_dependancies_cloud9

1. sudo amazon-linux-extras install python3.8

2. curl -O https://bootstrap.pypa.io/get-pip.py

3. python3.8 get-pip.py --user


##Ensuring data persistence Was the DataFrame correctly stored to the CSV file?


```python
import pandas
import os
# Import the os module
# Extract, transform and load dataraw_data = pd.read_csv("raw_stock_data.csv")
stock_data = raw_data.loc[raw_data["open"] > 100, ["timestamps", "open"]]stock_data.to_csv("stock_data.csv")
# Check that the path exists
file_exists = os.path.exists("stock_data.csv")
print(file_exists)
 ```
