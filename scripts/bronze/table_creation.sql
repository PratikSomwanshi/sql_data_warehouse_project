/*
 * table_creation.sql
 * Description : Create bronze layer table definitions for CRM and ERP dataset files.
 * Usage       : Execute in the DataWarehouse context to build bronze tables.
 */

USE DataWarehouse;

-- Bronze layer tables created from dataset source files.
IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;
create table bronze.crm_cust_info
(
    cst_id INT,
    cst_key NVARCHAR(50),
    cst_firstname NVARCHAR(50),
    cst_lastname NVARCHAR(50),
    cst_marital_status NVARCHAR(50),
    cst_gndr NVARCHAR(50),
    cst_create_date DATE
);
GO

IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;
create table bronze.crm_prd_info
(
    prd_id INT,
    prd_key NVARCHAR(100),
    prd_nm NVARCHAR(200),
    prd_cost DECIMAL(18, 2),
    prd_line NVARCHAR(50),
    prd_start_dt DATE,
    prd_end_dt DATE
);
GO

IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;
create table bronze.crm_sales_details
(
    sls_ord_num NVARCHAR(50),
    sls_prd_key NVARCHAR(50),
    sls_cust_id INT,
    sls_order_dt NVARCHAR(50),
    sls_ship_dt DATE,
    sls_due_dt DATE,
    sls_sales DECIMAL(18, 2),
    sls_quantity INT,
    sls_price DECIMAL(18, 2)
);
GO

IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;
create table bronze.erp_cust_az12
(
    cid NVARCHAR(50),
    bdate DATE,
    gen NVARCHAR(20)
);
GO

IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;
create table bronze.erp_loc_a101
(
    cid NVARCHAR(50),
    cntry NVARCHAR(100)
);
GO

IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;
create table bronze.erp_px_cat_g1v2
(
    id NVARCHAR(50),
    cat NVARCHAR(100),
    subcat NVARCHAR(100),
    maintenance NVARCHAR(20)
);
GO
