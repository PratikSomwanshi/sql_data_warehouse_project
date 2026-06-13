/*
 * data_ingetion.sql
 * Description : Load bronze tables from dataset CSV files using BULK INSERT.
 * Usage       : Execute this script to create or alter the bronze.load_bronze procedure.
 */

use DataWarehouse;

-- DROP PROCEDURE bronze.load_bronze

GO
CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME;
    BEGIN TRY
        PRINT '=========================================';
        PRINT 'Loading Bronze Layer';
        PRINT '=========================================';

        PRINT '-----------------------------------------';
        PRINT 'Loading CRM Tables';
        PRINT '-----------------------------------------';
        TRUNCATE TABLE bronze.crm_cust_info;

        set @start_time = GETDATE();
        PRINT 'Loading bronze.crm_cust_info from C:\SQLData\source_crm\cust_info.csv';

        BULK INSERT bronze.crm_cust_info
        FROM
        'C:\SQLData\source_crm\cust_info.csv'
        WITH
        (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK)


        TRUNCATE TABLE bronze.crm_prd_info;

        PRINT 'Loading bronze.prd_info from C:\SQLData\source_crm\prd_info.csv';
        BULK INSERT bronze.crm_prd_info
        FROM
        'C:\SQLData\source_crm\prd_info.csv'
        WITH
        (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK)


        TRUNCATE TABLE bronze.crm_sales_details;

        PRINT 'Loading bronze.sales_details from C:\SQLData\source_crm\sales_details.csv';
        BULK INSERT bronze.crm_sales_details
        FROM
        'C:\SQLData\source_crm\sales_details.csv'
        WITH
        (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);


        PRINT '-----------------------------------------';
        PRINT 'Loading ERP Tables';
        PRINT '-----------------------------------------';

        TRUNCATE TABLE bronze.erp_cust_az12;

        PRINT 'Loading bronze.cust_az12 from C:\SQLData\source_erp\CUST_AZ12.csv';
        BULK INSERT bronze.erp_cust_az12
        FROM
        'C:\SQLData\source_erp\CUST_AZ12.csv'
        WITH
        (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);


        TRUNCATE TABLE bronze.erp_loc_a101;

        PRINT 'Loading bronze.loc_a101 from C:\SQLData\source_erp\LOC_A101.csv';
        BULK INSERT bronze.erp_loc_a101
        FROM
        'C:\SQLData\source_erp\LOC_A101.csv'
        WITH
        (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);


        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        PRINT 'Loading bronze.px_cat_g1v2 from C:\SQLData\source_erp\PX_CAT_G1V2.csv';
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM
        'C:\SQLData\source_erp\PX_CAT_G1V2.csv'
        WITH
        (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

        set @end_time = GETDATE();

        PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

        SELECT COUNT(*) as crm_cust_info
    FROM bronze.crm_cust_info;

        SELECT COUNT(*) as crm_prd_info
    FROM bronze.crm_prd_info;

        SELECT COUNT(*) as crm_sales_details
    FROM bronze.crm_sales_details;

        SELECT COUNT(*) as erp_cust_az12
    FROM bronze.erp_cust_az12;

        SELECT COUNT(*) as erp_loc_a101
    FROM bronze.erp_loc_a101;

        SELECT COUNT(*) as erp_px_cat_g1v2
    FROM bronze.erp_px_cat_g1v2;
    END TRY
    BEGIN CATCH
        PRINT '============================================';
        PRINT 'ERROR OCCURED WHILE LOADING BRONZE LAYER';
        PRINT 'ERROR MESSAGE: ' + ERROR_MESSAGE();
        PRINT 'ERROR NUMBER: ' + CAST(ERROR_NUMBER() as NVARCHAR);
        PRINT '============================================';
    END CATCH
END;