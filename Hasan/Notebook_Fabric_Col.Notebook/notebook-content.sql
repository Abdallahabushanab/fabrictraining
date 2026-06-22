-- Fabric notebook source

-- METADATA ********************

-- META {
-- META   "kernel_info": {
-- META     "name": "synapse_pyspark"
-- META   },
-- META   "dependencies": {
-- META     "lakehouse": {
-- META       "default_lakehouse": "93353530-b58d-49e9-98fa-fd6d407885c0",
-- META       "default_lakehouse_name": "Lakehouse_HAL",
-- META       "default_lakehouse_workspace_id": "558b72f4-f4fb-4d9d-8e76-b69b0cfe0a20",
-- META       "known_lakehouses": [
-- META         {
-- META           "id": "93353530-b58d-49e9-98fa-fd6d407885c0"
-- META         }
-- META       ]
-- META     }
-- META   }
-- META }

-- CELL ********************

-- MAGIC %%sql
-- MAGIC -- Step 1: Add the new column
-- MAGIC ALTER TABLE Lakehouse_HAL.dbo.Customer 
-- MAGIC ADD COLUMNS (Fabric STRING);
-- MAGIC 
-- MAGIC -- Step 2: Update all rows with value 'Fabric'
-- MAGIC UPDATE Lakehouse_HAL.dbo.Customer 
-- MAGIC SET Fabric = 'Fabric';

-- METADATA ********************

-- META {
-- META   "language": "sparksql",
-- META   "language_group": "synapse_pyspark"
-- META }
