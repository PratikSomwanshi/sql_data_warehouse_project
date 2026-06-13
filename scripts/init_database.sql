

/*******************************************************************************
 * init_database.sql
 * ---------------------------------------------------------------------------
 * Description : Creates the DataWarehouse database and the bronze/silver/gold
 *               schemas used by the ETL pipeline.
 *
 * Notes:
 *  - If a database named 'DataWarehouse' exists it will be dropped (FORCE).
 *  - Intended for development/testing only. DO NOT RUN on production systems.
 ******************************************************************************/


USE master;

GO

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- CREATE Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO