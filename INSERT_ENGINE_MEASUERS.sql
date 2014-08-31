-- INSERT MDP MEASURES 
-- Engine Input Columns for SCAN 1
alter table msc_dm_mock_mdp_matrix add (GLOB_PROP           NUMBER DEFAULT 1);
alter table msc_dm_mock_mdp_matrix add (DO_AGGRI            NUMBER(1) DEFAULT 1); 		-- Default Should be 1
alter table msc_dm_mock_mdp_matrix add (AGGRI_98            NUMBER(1) DEFAULT 1); 		-- Default hardcoded 
alter table msc_dm_mock_mdp_matrix add (AGGRI_99            NUMBER(1) DEFAULT 1); 		-- Default hardcoded 
alter table msc_dm_mock_mdp_matrix add (DO_FORE             NUMBER(1) DEFAULT 1); 		-- Default Should be 1
alter table msc_dm_mock_mdp_matrix add (PREDICTION_STATUS   NUMBER(2) DEFAULT 1);
-- Engine Output Columns SCAN 1
alter table msc_dm_mock_mdp_matrix add (ITEM_NODE           NUMBER(10,0));				-- Remove
alter table msc_dm_mock_mdp_matrix add (LOC_NODE            NUMBER(20,10) DEFAULT 1.0); -- Remove
alter table msc_dm_mock_mdp_matrix add (LEVEL_ID            NUMBER(20,10) DEFAULT 1.0); -- Check which measures should be used instead
alter table msc_dm_mock_mdp_matrix add (OUTLIER             NUMBER(20,10) DEFAULT 1.0); -- Check which measures should be used instead
alter table msc_dm_mock_mdp_matrix add (METRICS_MAPE        NUMBER(20,10) DEFAULT 1.0); -- Remove
alter table msc_dm_mock_mdp_matrix add (METRICS_PBIAS       NUMBER(20,10) DEFAULT 1.0); -- Remove
alter table msc_dm_mock_mdp_matrix add (METRICS_MRE         NUMBER(20,10) DEFAULT 1.0); -- Remove
alter table msc_dm_mock_mdp_matrix add (METRICS_RMSE        NUMBER(20,10) DEFAULT 1.0); -- Remove
alter table msc_dm_mock_mdp_matrix add (METRICS_OBS         NUMBER(20,10) DEFAULT 1.0); -- Remove
alter table msc_dm_mock_mdp_matrix add (MODELS              VARCHAR2(20 BYTE));			-- Check which measures should be used instead
alter table msc_dm_mock_mdp_matrix add (DELMODEL            VARCHAR2(20 BYTE));			-- Remove
alter table msc_dm_mock_mdp_matrix add (BRANCH_ID           NUMBER(10,0));				-- Remove
alter table msc_dm_mock_mdp_matrix add (LAST_UPDATE_DATE    DATE);						-- Check which measures should be used instead
alter table msc_dm_mock_mdp_matrix add (SALES_DATA_LUD      DATE);						-- Remove

-- INSERT SALES DATA MEASURES
--Engine Input Columns for AGGRI SQL
alter table msc_dm_mock_sales_data add (PRICE               NUMBER DEFAULT 1);
alter table msc_dm_mock_sales_data add (ERROR_STD           NUMBER DEFAULT 1);
alter table msc_dm_mock_sales_data add (UP_TIME             NUMBER DEFAULT 1);
--Engine Sales Output Columns 
alter table msc_dm_mock_sales_data add (FORECAST            NUMBER(20,10) DEFAULT NULL);
alter table msc_dm_mock_sales_data add (FORECAST_OUTLIER    NUMBER(20,10) DEFAULT NULL);
alter table msc_dm_mock_sales_data add (SIG_SQR             NUMBER DEFAULT NULL);
alter table msc_dm_mock_sales_data add (REGIME_CHANGE       NUMBER(20,10) DEFAULT NULL);
alter table msc_dm_mock_sales_data add (LAST_UPDATE_DATE    DATE DEFAULT NULL);

