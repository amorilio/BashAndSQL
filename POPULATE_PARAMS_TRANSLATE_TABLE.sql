create or replace
PROCEDURE ENG_CREATE_PARAM_TL_TABLE 
IS 
vs_sql             	VARCHAR2(3200);
vi_exists          	INTEGER;
vs_param_name    	VARCHAR2(100);
vi_pvalue          	NUMBER;
TYPE rec1_cursor    IS REF CURSOR;
rec1      	        rec1_cursor;

BEGIN


vs_sql := 'SELECT COUNT(*) FROM   user_tables  WHERE UPPER(table_name) = ''MSC_ENG_PARAMETERS_TL''';
EXECUTE IMMEDIATE  (vs_sql) INTO vi_exists;

IF vi_exists = 1 THEN
	vs_sql := 'DROP TABLE MSC_ENG_PARAMETERS_TL';
	EXECUTE IMMEDIATE  (vs_sql);
    COMMIT;
END IF;

vs_sql := 'create table MSC_ENG_PARAMETERS_TL ( 
PARAMETER_ID                   NUMBER(18)   NOT NULL ,
LANGUAGE                       VARCHAR2(16) NOT NULL ,
SOURCE_LANG                    VARCHAR2(16) NOT NULL ,
PARAMETER_DESCRIPTION          VARCHAR2(100),
CREATED_BY                     VARCHAR2(64) NOT NULL ,
CREATION_DATE                  TIMESTAMP(6) NOT NULL ,
LAST_UPDATED_BY                VARCHAR2(64) NOT NULL ,
LAST_UPDATE_DATE               TIMESTAMP(6) NOT NULL ,
LAST_UPDATE_LOGIN              VARCHAR2(32))';
EXECUTE IMMEDIATE  (vs_sql);
COMMIT;


vs_sql := 'SELECT PARAMETER_ID, PARAMETER_NAME from MSC_ENG_PARAMETERS_B order by PARAMETER_ID';
	OPEN rec1 FOR vs_sql;
	LOOP
		FETCH rec1 INTO  vi_pvalue, vs_param_name;
			EXIT WHEN rec1%NOTFOUND;
			vs_sql := 'INSERT INTO MSC_ENG_PARAMETERS_TL (PARAMETER_ID,LANGUAGE,SOURCE_LANG,PARAMETER_DESCRIPTION,CREATED_BY,CREATION_DATE,LAST_UPDATED_BY,LAST_UPDATE_DATE,LAST_UPDATE_LOGIN) values ('||vi_pvalue||',''US'',''US'','''||vs_param_name||''',''anonymous'',''30-AUG-12'', ''anonymous'', ''30-AUG-12''	, ''anonymous'')';
			EXECUTE IMMEDIATE  vs_sql;
			vs_sql := 'INSERT INTO MSC_ENG_PARAMETERS_TL (PARAMETER_ID,LANGUAGE,SOURCE_LANG,PARAMETER_DESCRIPTION,CREATED_BY,CREATION_DATE,LAST_UPDATED_BY,LAST_UPDATE_DATE,LAST_UPDATE_LOGIN) values ('||vi_pvalue||',''KO'',''US'','''||vs_param_name||''',''anonymous'',''30-AUG-12'', ''anonymous'', ''30-AUG-12''	, ''anonymous'')';
			EXECUTE IMMEDIATE  vs_sql;
	END LOOP; 
	CLOSE rec1;    
	COMMIT;    
END ENG_CREATE_PARAM_TL_TABLE;
/

call ENG_CREATE_PARAM_TL_TABLE()
