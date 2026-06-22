# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "3c7ef6a5-aa3b-4a4b-a9d6-8d326049f9a0",
# META       "default_lakehouse_name": "Hasan_LakeHouse",
# META       "default_lakehouse_workspace_id": "558b72f4-f4fb-4d9d-8e76-b69b0cfe0a20",
# META       "known_lakehouses": [
# META         {
# META           "id": "3c7ef6a5-aa3b-4a4b-a9d6-8d326049f9a0"
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

# MAGIC %%sql
# MAGIC df = spark.sql("SELECT * FROM Hasan_LakeHouse.dbo.Customer LIMIT 1000")
# MAGIC display(df)

# METADATA ********************

# META {
# META   "language": "sparksql",
# META   "language_group": "synapse_pyspark"
# META }
