# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "c5954c0b-eea7-4dda-9baf-d4999aafe124",
# META       "default_lakehouse_name": "lakehouse1",
# META       "default_lakehouse_workspace_id": "558b72f4-f4fb-4d9d-8e76-b69b0cfe0a20",
# META       "known_lakehouses": [
# META         {
# META           "id": "c5954c0b-eea7-4dda-9baf-d4999aafe124"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

# Welcome to your new notebook
# Type here in the cell editor to add code!


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

df = spark.read.parquet("Files/sales_data (1)/part-00000-547f59a3-42b7-4b22-8029-e6cefe361e27-c000.snappy.parquet")
# df now is a Spark DataFrame containing parquet data from "Files/sales_data (1)/part-00000-547f59a3-42b7-4b22-8029-e6cefe361e27-c000.snappy.parquet".
display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
