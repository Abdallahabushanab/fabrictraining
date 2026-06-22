# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "d5147d7c-ea26-4571-be49-203c2bce4eb1",
# META       "default_lakehouse_name": "AZSQLDB_LH",
# META       "default_lakehouse_workspace_id": "558b72f4-f4fb-4d9d-8e76-b69b0cfe0a20",
# META       "known_lakehouses": [
# META         {
# META           "id": "d5147d7c-ea26-4571-be49-203c2bce4eb1"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

# Option 1: Using SQL (recommended for Fabric Lakehouse)
spark.sql("ALTER TABLE AZSQLDB_LH.dbo.Customer ADD COLUMN fabric STRING")
spark.sql("UPDATE AZSQLDB_LH.dbo.Customer SET fabric = 'fabric'")
 
# Verify the update
df = spark.sql("SELECT * FROM AZSQLDB_LH.dbo.Customer LIMIT 1000")
display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
