
# Exercise 0 - Cloud & Databricks Intro
In this exercise, you will revise concepts of cloud and Databricks introduction covered in lectures 0 to 4.

## 1. Upload data files to Databricks
Under your free edition workspace of Databricks, create the bronze layer of a medallion architecture for Airbnb accomodation data. You will be using a csv file of Airbnb accomodation data available in [Kaggle](https://www.kaggle.com/datasets/arianazmoudeh/airbnbopendata). Follow the steps below:

&nbsp; a) Create a new *catalog*, *airbnb*

&nbsp; b) Create a *schema*, *hosts*

&nbsp; c) Create a *volume*, *csv_files* and upload the csv file from Kaggle here

&nbsp; d) Now create a notebook to define a Lakeflow Spark Declarative Pipeline. This pipeline should be able to produce a streaming table under the same schema created in question b) above. Use a Lakeflow Job to schedule a run of the pipeline. Do your pipeline and job running run as expected?

&nbsp; e) In question d) above, you have combined the use of SDP and Lakeflow Job to orchestrate the bronze layer of your medallion architecture for Airbnb accomodation data. Can you recreate your orchestration with a purely imperative approach? And can you explain what is the difference between imperative and declarative approach of orchestration?
 
## 2. EDA with PySpark
Now, you have a table of Airbnb hosts data in your created catalog and schema. Let's understand the data a little bit before further processing the data.

Create a new notebook for EDA wit PySpark and:

&nbsp; a) Show a histogram of numbers of reviews for each accomodation.

&nbsp; b) Clean the price column. Is it numeric?

&nbsp; c) Calculate the average price of accomodations per neighborhood group. In which neighborhood group is the average price highest?

&nbsp; d) Show the top 10 accomodations with most reviews.

&nbsp; e) Show the top 10 accomodations with best reviews.

## 3. Theory questions

&nbsp; a) Why enterprises are moving from on-premises to cloud IT infrastructure?

&nbsp; b) What are different layers in medallion architecture in Databricks?

&nbsp; c) Are big data and cloud the same concept? Explain your thoughts in details.

&nbsp; d) Are unity catalog and catalog the same thing in Databricks?

&nbsp; e) In Databricks free edition account, where are your data stored?

## Glossary

Fill in this table either by copying this into your own markdown file or copy it into a spreadsheet if you feel that is easier to work with.

| terminology         | explanation |
| ------------------- | ----------- |
| on-premises IT infrastructure           |             |
| cloud IT infrastructure       |             |
| 3 Vs of big data |             |
| scalability           |             |
| availability           |             |
| lakeflow job      |             |
| lakeflow spark declarative pipeline            |             |
| unity catalog           |             |
