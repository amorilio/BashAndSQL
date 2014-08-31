
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
drop table ENGINE_BRANCH_LIST;

-- created ENGINE_BRANCH_LIST table
CREATE TABLE ENGINE_BRANCH_LIST (
		BRANCH_ID         NUMBER(10),
		BRANCH_STATUS     INTEGER	DEFAULT (0),
		IU_LAST_DATE      DATE		DEFAULT TO_DATE('01-01-1900 00:00:00','MM-DD-YYYY HH24:MI:SS'),
		ITEM              NUMBER,
		LOCATION          NUMBER
) NOPARALLEL;

-- Truncate updated table
truncate table ENGINE_BRANCH_LIST;
-- Insert ordered by item locations into the branch list table
insert into ENGINE_BRANCH_LIST (item,location) select distinct item_id, organization_id from msc_dm_mock_mdp_matrix_xl order by item_id, organization_id;
-- Update branch id relatively to current rownumber (10 avialable branches)
MERGE INTO ENGINE_BRANCH_LIST TRG
USING (
  with rows_count_table as (select count(*) as rows_count from engine_branch_list)
  select item,location,trunc(((rownum-1)*&1)/rows_count_table.rows_count)+1 as branch_id, rows_count_table.rows_count  from engine_branch_list,rows_count_table
) SRC
ON (SRC.item = TRG.item AND SRC.location = TRG.location)
WHEN MATCHED THEN UPDATE SET TRG.branch_id = SRC.branch_id;
-- Check updated table
select * from ENGINE_BRANCH_LIST;