create or replace
PROCEDURE ENG_CREATE_PARAM_TABLE 
( ii_PROFILE_ID IN NUMBER DEFAULT 1 ) 
IS 
vs_sql             	VARCHAR2(3200);
vs_sql2            	VARCHAR2(3200);
vi_exists          	INTEGER;
vs_param_name    	VARCHAR2(100);
vi_pvalue          	NUMBER;
TYPE rec1_cursor    IS REF CURSOR;
rec1      	        rec1_cursor;

BEGIN

vs_sql := 'SELECT COUNT(*) FROM   user_tables  WHERE UPPER(table_name) = ''MSC_PROFILE_ENG_PARAMS_VALUES''';
EXECUTE IMMEDIATE  (vs_sql) INTO vi_exists;

IF vi_exists = 0 THEN
	vs_sql := 'CREATE TABLE MSC_PROFILE_ENG_PARAMS_VALUES (PROFILE_ID NUMBER)';
	EXECUTE IMMEDIATE  (vs_sql);
	vs_sql := 'SELECT    PARAMETER_NAME, PARAMETER_DEF_VALUE_NUM  from MSC_ENG_PARAMETERS_B order by PARAMETER_ID';
	OPEN rec1 FOR vs_sql;
	LOOP
		FETCH rec1 INTO  vs_param_name , vi_pvalue;
			EXIT WHEN rec1%NOTFOUND;
		vs_sql2 := 'ALTER TABLE MSC_PROFILE_ENG_PARAMS_VALUES ADD ('||vs_param_name||'    NUMBER)';
        EXECUTE IMMEDIATE  vs_sql2;
	END LOOP; 
    CLOSE rec1;
    vs_sql := ' ALTER TABLE MSC_PROFILE_ENG_PARAMS_VALUES ADD ( CREATED_BY VARCHAR2(64) , CREATION_DATE DATE, LAST_UPDATED_BY VARCHAR2(64) , LAST_UPDATE_DATE DATE, LAST_UPDATE_LOGIN VARCHAR2(32))';
    EXECUTE IMMEDIATE  vs_sql;
    COMMIT;
END IF;

vs_sql := 'SELECT count(*) FROM MSC_PROFILE_ENG_PARAMS_VALUES WHERE PROFILE_ID = '|| ii_PROFILE_ID ||' ';
EXECUTE IMMEDIATE  (vs_sql) INTO vi_exists;
IF vi_exists > 0 THEN
	NULL;
ELSE
	vs_sql := 'INSERT INTO MSC_PROFILE_ENG_PARAMS_VALUES  (PROFILE_ID,CREATED_BY,CREATION_DATE ,LAST_UPDATED_BY,LAST_UPDATE_DATE, LAST_UPDATE_LOGIN)  VALUES ('||ii_PROFILE_ID||', ''anonymous'',	''30-AUG-12'', ''anonymous'', ''30-AUG-12''	, ''anonymous'')';
	EXECUTE IMMEDIATE  vs_sql;
	COMMIT;
	vs_sql := 'SELECT    PARAMETER_NAME, PARAMETER_DEF_VALUE_NUM  from MSC_ENG_PARAMETERS_B order by PARAMETER_ID';
	OPEN rec1 FOR vs_sql;
	LOOP
		FETCH rec1 INTO  vs_param_name , vi_pvalue;
			EXIT WHEN rec1%NOTFOUND;
		vs_sql2 := 'UPDATE MSC_PROFILE_ENG_PARAMS_VALUES SET '||vs_param_name||'  =  '||vi_pvalue||' WHERE PROFILE_ID = '||ii_PROFILE_ID||' ';
		EXECUTE IMMEDIATE  vs_sql2;
    END LOOP; 
	CLOSE rec1;    
	COMMIT;    
    END IF;
END ENG_CREATE_PARAM_TABLE;
/

call ENG_CREATE_PARAM_TABLE(&1)