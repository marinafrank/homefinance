-- apex 21.1
-- FAIL - Application Express installation requires database version 12.1.0.2.0

mkdir -p /data/oracle/oradata21
chown -R 54321:54321 /data/oracle/oradata21


-- 11.2 datapump export

CREATE OR REPLACE DIRECTORY HF_INCOMING AS '/u01/app/oracle/oradata/';

expdp \"/ as sysdba\" schemas=HOMEFINANCE directory=HF_INCOMING dumpfile=HF_INCOMING.dmp logfile=HF_INCOMING.log

systemctl stop oracle.service

/data/oracle/oradata

-- setup new db
alter session set container=cdb$root;
alter system set db_create_file_dest='/opt/oracle/oradata' scope=both;
CREATE TABLESPACE APEX_212000;


alter session set container=hf;
alter system set db_create_file_dest='/opt/oracle/oradata' scope=both;
CREATE TABLESPACE APEX_212000;

create user homefinance identified by homefinance;
grant dba to homefinance;
select RESOURCE_NAME,limit from dba_profiles where profile='DEFAULT';
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME unlimited;
ALTER PROFILE DEFAULT LIMIT PASSWORD_VERIFY_FUNCTION null;



sqlplus homefinance/homefinance@localhost/hf
CREATE OR REPLACE DIRECTORY HF_INCOMING AS '/opt/oracle/oradata';
impdp homefinance/homefinance@localhost/hf schemas=HOMEFINANCE directory=HF_INCOMING dumpfile=HF_INCOMING.dmp logfile=impdp_HF_INCOMING.log

-- check dba-registry
select comp_name, version_full,status from dba_registry;
-- Oracle XML Database 21.3.0.0.0                     INVALID
select owner, object_name, object_type, status
from dba_objects
where status = 'INVALID' and owner='SYS'
order by owner, object_name;
-- no invalid obj
-- repair invalid XDB
spool xdbreload.log
set echo on;
shutdown immediate;
startup upgrade;
alter pluggable database all open upgrade;
@?/rdbms/admin/xdbrelod.sql
-- run xdbrelod.sql for all PDBs!
shutdown immediate;
startup;
@?/rdbms/admin/utlrp.sql
spool off
