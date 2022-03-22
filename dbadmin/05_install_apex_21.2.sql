cd /opt/oracle/oradata/apex_21.2/

sqlplus / as sysdba
@apexins.sql APEX_212000 USERS TEMP /i/
alter session set container=hf;
@apexins.sql APEX_212000 USERS TEMP /i/

BEGIN
  apex_instance_admin.set_parameter('MAX_SESSION_IDLE_SEC',604800);
  apex_instance_admin.set_parameter('MAX_SESSION_LENGTH_SEC',604800);
  apex_instance_admin.set_parameter('STRONG_SITE_ADMIN_PASSWORD','N');
  apex_instance_admin.set_parameter('ACCOUNT_LIFETIME_DAYS',999);
  apex_instance_admin.set_parameter('AUTOEXTEND_TABLESPACES','Y');
  apex_instance_admin.set_parameter('EXPIRE_FND_USER_ACCOUNTS','N') ;
  apex_instance_admin.set_parameter('LOGIN_THROTTLE_DELAY',0) ;
  COMMIT;
END;
/

select username, ACCOUNT_STATUS, PROFILE from dba_users where username = 'APEX_PUBLIC_USER';
-- unlock works on root level
alter session set container=cdb$root;
ALTER USER APEX_PUBLIC_USER ACCOUNT UNLOCK;
ALTER USER APEX_PUBLIC_USER IDENTIFIED BY "<>";
@apex_rest_config.sql
alter session set container=hf;
@apex_rest_config.sql

The structure of the link to the Application Express administration services is as follows:
http://host:port/apex/apex_admin

The structure of the link to the Application Express development interface is as follows:
http://host:port/apex
