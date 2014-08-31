
--
--
-- Usage to divide whole tree to 6 branches
-- @"d:\FusionBuild\engine2k\ypd\script\FusionConfigScripts\CREATE_POPULATE_ENGINE_BRANCH_LIST.sql" 6
--
--

ALTER SESSION DISABLE PARALLEL DDL;
ALTER SESSION DISABLE PARALLEL DML;
ALTER SESSION DISABLE PARALLEL QUERY;
--
-- Pay attantion to disable PARALLELISM before running the MERGE SQL.
-- Because rows are merged asyncronically.
--
DROP TABLE MSC_ENGINE_BRANCH_LIST;
-- created ENGINE_BRANCH_LIST table
CREATE TABLE MSC_ENGINE_BRANCH_LIST (
	EXECUTION_ID      NUMBER(18) ,
	PLAN_ID           NUMBER(18) ,
	PROFILE_ID        NUMBER(18) ,
	BRANCH_ID         NUMBER(18) ,
	BRANCH_STATUS     INTEGER	DEFAULT (0),
	LAST_UPDATE_DATE  DATE		DEFAULT TO_DATE('01-01-1900 00:00:00','MM-DD-YYYY HH24:MI:SS'),
	ITEM              NUMBER,
	LOCATION          NUMBER
) NOPARALLEL;

-- Truncate updated table
truncate table MSC_ENGINE_BRANCH_LIST;
-- Insert ordered by item locations into the branch list table
insert into MSC_ENGINE_BRANCH_LIST (item,location) select distinct item_id, organization_id from msc_dm_mock_mdp_matrix order by item_id, organization_id;
update MSC_ENGINE_BRANCH_LIST set EXECUTION_ID=1,PLAN_ID=0,PROFILE_ID=300100010946731;
-- Update branch id relatively to current rownumber (10 avialable branches)
MERGE INTO MSC_ENGINE_BRANCH_LIST TRG
USING (
  with rows_count_table as (select count(*) as rows_count from MSC_ENGINE_BRANCH_LIST)
  select item,location,trunc(((rownum-1)*&1)/rows_count_table.rows_count)+1 as branch_id, rows_count_table.rows_count  from MSC_ENGINE_BRANCH_LIST,rows_count_table
) SRC
ON (SRC.item = TRG.item AND SRC.location = TRG.location)
WHEN MATCHED THEN UPDATE SET TRG.branch_id = SRC.branch_id;
-- Check updated table
select * from MSC_ENGINE_BRANCH_LIST;