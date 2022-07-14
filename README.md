# fintech_hwk7

This is my homework submission for Fintech Bootcamp Week7. The exercise involves creating a database schema for storing credit card transactions, and then performing some SQL queries for detecting outliers and potential fraudulent transactions.

The contents include:

Data - SQL insert scripts for data used in this exercise
Schema & Queries - ERD diagram, table creation scripts, and designated queries
visual_data_analysis - Jupyter notebook for visualizing transactions of a select few cardholders
challenge - Jupyter notebook for calculating outliers using standard deviation and interquartile approaches

The results of the queries yielded:
-There didn't seem to be an abnormal amount of small transactions by any cardholder, and the cardholders with the most small transactions all have a large number of total transactions
-There were some abnormally large transactions between 7 and 9 am, but this timerange didn't have more anomalies than other hours in the day
