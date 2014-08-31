-- Disable All LOCAL causal factors except PRICE because there are no coresponding measures in SALES DATA
--300100011879743	CHRISTMAS	      local	0	1	1	0	0
--300100011879744	EASTER	        local	0	1	1	0	0
--300100011879745	THANKS GIVING	  local	0	1	1	0	0
--300100011879746	LABOR DAY	      local	0	1	1	0	0
--300100011879747	MEMORIAL DAY	  local	0	1	1	0	0
--300100011879748	NEW YEAR'S DAY	local	0	1	1	0	0

-- Disable All Causals which are not in 'January','February','March','April','May','June','July','August','September','October','November','December','Price','Constant','Trend'
update MSC_PROFILE_CAUSAL_FACTORS_B set SHORT_METHODS=0 ,LONG_METHODS=0 ,MULTI_METHOD_GR1=0 ,MULTI_METHOD_GR2=0 ,NON_SEASONAL=0  
where (PLAN_ID,PROFILE_ID,CAUSAL_FACTOR_ID) in (select plan_id,profile_id,causal_factor_id from MSC_PROFILE_CAUSAL_FACTORS_TL where language='US' and  
causal_factor_disp_name not in ('January','February','March','April','May','June','July','August','September','October','November','December','Price','Constant','Trend'));
-- Check All Causals which are not in 'January','February','March','April','May','June','July','August','September','October','November','December','Price','Constant','Trend'
select SHORT_METHODS,LONG_METHODS,MULTI_METHOD_GR1,MULTI_METHOD_GR2,NON_SEASONAL from MSC_PROFILE_CAUSAL_FACTORS_B
where (PLAN_ID,PROFILE_ID,CAUSAL_FACTOR_ID) in (select plan_id,profile_id,causal_factor_id from MSC_PROFILE_CAUSAL_FACTORS_TL where language='US' and  
causal_factor_disp_name not in ('January','February','March','April','May','June','July','August','September','October','November','December','Price','Constant','Trend'));


-- Popilate the PRICE casual factor with random values.
-- If all PRICE values will be 1 the column will be considered as CONSTANT 
-- Engine will warn and remove the column.
DECLARE
   v  NUMBER;
   av NUMBER;
BEGIN
   FOR i IN  (SELECT rowid FROM msc_dm_mock_sales_data)
   LOOP
      v     := TRUNC(dbms_random.value(1,100));
      IF v   < 40 THEN  
        av := 1; 
      END IF;
      IF v   >= 40 and v < 60 THEN av := 11; END IF;
      IF v   >= 60 and v < 80 THEN av := 22; END IF;
      IF v >= 80 then av := 33;                  END IF;
      UPDATE msc_dm_mock_sales_data SET PRICE=av WHERE rowid=i.rowid;
            --dbms_output.put_line(v);
   END LOOP;
   COMMIT;
END;
/
