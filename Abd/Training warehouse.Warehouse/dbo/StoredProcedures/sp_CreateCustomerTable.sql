-- Create the stored procedure
CREATE PROCEDURE [dbo].[sp_CreateCustomerTable]
AS
BEGIN
    -- Drop the target table if it already exists
    DROP TABLE IF EXISTS [dbo].[Customer_New];

    -- Create the new table with the same columns
    CREATE TABLE [dbo].[Customer_New]
    (
        CustomerID   VARCHAR(10),
        CustomerName VARCHAR(100),
        Region       VARCHAR(50),
        [Custom]     BIT
    );

    -- Load data from the source table
    INSERT INTO [dbo].[Customer_New] (CustomerID, CustomerName, Region, [Custom])
    SELECT
        CustomerID,
        CustomerName,
        Region,
        [Custom]
    FROM Abdallah_LH.dbo.Customer;
END;