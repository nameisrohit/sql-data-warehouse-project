Execute bronze.load_bronze;

CREATE OR ALTER PROCEDURE bronze.load_bronze as 
 begin

 declare @start_time DATETIME, @end_time DATETIME;

 begin TRY
	
		print '***************************';
		print 'Loading Bronze Layer';
		print '***************************';
----------------------------------------------------------------------------------------------------
		print '***************************';
		print 'Loading CRM Table';
		print '***************************';
----------------------------------------------------------------------------------------------------
		SET @start_time = GETDATE();

		print '>>Truncating Table : bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;

		print '>>Inserting Data Into : bronze.crm_cust_info';
		bulk insert bronze.crm_cust_info
		from 'C:\Users\Rohit\OneDrive\Desktop\SQL DataWarehouse Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'

		with (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		print 'Load Duration: ' + cast(Datediff(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';

----------------------------------------------------------------------------------------------------


		SET @start_time = GETDATE();

		print '>>Inserting Data Into : bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;
		bulk insert bronze.crm_prd_info
		from 'C:\Users\Rohit\OneDrive\Desktop\SQL DataWarehouse Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'

		with (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		print 'Load Duration: ' + cast(Datediff(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';

----------------------------------------------------------------------------------------------------

		SET @start_time = GETDATE();
		print '>>Inserting Data Into : bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;
		bulk insert bronze.crm_sales_details
		from 'C:\Users\Rohit\OneDrive\Desktop\SQL DataWarehouse Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'

		with (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		print 'Load Duration: ' + cast(Datediff(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';

----------------------------------------------------------------------------------------------------


		print '***************************';
		print 'Loading ERP Table';
		print '***************************';

----------------------------------------------------------------------------------------------------

		SET @start_time = GETDATE();
		print '>>Inserting Data Into : bronze.erp_CUST_AZ12';
		TRUNCATE TABLE bronze.erp_CUST_AZ12;
		bulk insert bronze.erp_CUST_AZ12
		from 'C:\Users\Rohit\OneDrive\Desktop\SQL DataWarehouse Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'

		with (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		print 'Load Duration: ' + cast(Datediff(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';

----------------------------------------------------------------------------------------------------

		SET @start_time = GETDATE();
		print '>>Inserting Data Into : bronze.erp_LOC_A101';
		TRUNCATE TABLE bronze.erp_LOC_A101;
		bulk insert bronze.erp_LOC_A101
		from 'C:\Users\Rohit\OneDrive\Desktop\SQL DataWarehouse Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'

		with (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		print 'Load Duration: ' + cast(Datediff(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';

----------------------------------------------------------------------------------------------------

		SET @start_time = GETDATE();
		print '>>Inserting Data Into : bronze.erp_PX_CAT_G1V2';
		TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;
		bulk insert bronze.erp_PX_CAT_G1V2
		from 'C:\Users\Rohit\OneDrive\Desktop\SQL DataWarehouse Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'

		with (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		print 'Load Duration: ' + cast(Datediff(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';

	end try
----------------------------------------------------------------------------------------------------

	begin catch
		print '====================================';
		print 'Error occured';
		print 'Error Message' + ERROR_MESSAGE();
		print 'Error Message' + cast(ERROR_MESSAGE() AS NVARCHAR);
		print 'Error Message' + cast(ERROR_state() AS NVARCHAR);
	end catch

end
