/*
 * data_ingetion_procedure.sql
 * Description : Executes the bronze.load_bronze procedure to load bronze CSV data.
 * Author      : Pratik Somwanshi
 * Created     : 2026-06-13
 * Usage       : Run this script in the DataWarehouse context to validate ingestion.
 */

EXEC bronze.load_bronze;