# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "f121b162-7e42-4150-9319-49029b7f13e9",
# META       "default_lakehouse_name": "Abdallah_LH",
# META       "default_lakehouse_workspace_id": "558b72f4-f4fb-4d9d-8e76-b69b0cfe0a20",
# META       "known_lakehouses": [
# META         {
# META           "id": "f121b162-7e42-4150-9319-49029b7f13e9"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

# Option 1: Using SQL (recommended for Fabric Lakehouse)
spark.sql("ALTER TABLE Abdallah_LH.dim.Customer ADD COLUMN fabric STRING")
spark.sql("UPDATE Abdallah_LH.dim.Customer SET fabric = 'fabric'")

# Verify the update
df = spark.sql("SELECT * FROM Abdallah_LH.dim.Customer LIMIT 1000")
display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
