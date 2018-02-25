-- the script should be rerun after importing hf schema dump into a new database 
BEGIN
  apex_instance_admin.set_parameter('MAX_SESSION_IDLE_SEC',604800);
  apex_instance_admin.set_parameter('MAX_SESSION_LENGTH_SEC',604800);
  apex_instance_admin.set_parameter('STRONG_SITE_ADMIN_PASSWORD','N');
  apex_instance_admin.set_parameter('ACCOUNT_LIFETIME_DAYS',99999);
  apex_instance_admin.set_parameter('AUTOEXTEND_TABLESPACES','Y');
  apex_instance_admin.set_parameter('EXPIRE_FND_USER_ACCOUNTS','N') ;
  apex_instance_admin.set_parameter('LOGIN_THROTTLE_DELAY',0) ;
  COMMIT;
END;
/
COLUMN apex_schema new_value apex_schema

SELECT SCHEMA apex_schema
  FROM dba_registry
 WHERE comp_id = 'APEX';

ALTER SESSION SET CURRENT_SCHEMA=&apex_schema;

prompt
-- (re-)create job to force session lifetime defined in hf desktop app for all hf applications
DECLARE
  v_life_days NUMBER;
  v_wrksp_id  wwv_flows.security_group_id%TYPE;
  v_job       VARCHAR2(61) := 'APEXHF_FORCE_SESSION_LIFETIME';
  v_appname   wwv_flows.name%TYPE := 'HFDESKTOP';
  v_wrkspname wwv_flow_companies.short_name%TYPE := 'HF';
BEGIN

  SELECT nvl(a.max_session_length_sec, 604800) / 86400
       , a.security_group_id
    INTO v_life_days
       , v_wrksp_id
    FROM wwv_flows a
    JOIN wwv_flow_companies f ON a.security_group_id = f.provisioning_company_id
   WHERE a.name = v_appname
     AND f.short_name = v_wrkspname;

  BEGIN
    SELECT j.owner||'.'||j.job_name
      INTO v_job
      FROM dba_scheduler_jobs j
     WHERE j.owner = '&apex_schema'
       AND j.job_name = v_job;

      dbms_scheduler.drop_job(job_name => v_job);

    EXCEPTION WHEN no_data_found THEN
      v_job := '&apex_schema..'||v_job;
  END;

  sys.dbms_scheduler.create_job
  ( job_name            => v_job,
    job_type            => 'PLSQL_BLOCK',
    job_action          => 'DECLARE' || chr(10) ||
                           '  e_resource_busy EXCEPTION;' || chr(10) ||
                           '  PRAGMA EXCEPTION_INIT(e_resource_busy,-54);' || chr(10) ||
                           '  CURSOR upd_cur IS' || chr(10) ||
                           '  SELECT es.id' || chr(10) ||
                           '    FROM wwv_flow_sessions$ es' || chr(10) ||
                           '   WHERE es.security_group_id='|| v_wrksp_id || chr(10) ||
                           '   FOR UPDATE NOWAIT;'|| chr(10) ||
                           'BEGIN'|| chr(10) ||
                           'FOR i IN upd_cur LOOP' || chr(10) ||
                           '  UPDATE wwv_flow_sessions$ es' || chr(10) ||
                           '     SET es.life_timeout_on = es.created_on + ' || v_life_days || chr(10) ||
                           '       , es.idle_timeout_on = es.created_on + ' || v_life_days || chr(10) ||
                           '   WHERE CURRENT OF upd_cur;'      || chr(10) ||
                           '   END LOOP;' || chr(10) ||
                           'EXCEPTION WHEN e_resource_busy THEN NULL;'|| chr(10) ||
                           'END;',
    start_date          =>  SYSDATE,
    repeat_interval     => 'Freq=HOURLY;ByMinute=59',
    end_date            => to_date(null),
    job_class           => 'DEFAULT_JOB_CLASS',
    enabled             => true,
    auto_drop           => false,
    comments            => 'Forces '||v_wrkspname||' sessions to have application-defined timeout.');

  sys.dbms_scheduler.set_attribute
  ( name => '&apex_schema..ORACLE_APEX_PURGE_SESSIONS'
  , attribute => 'repeat_interval'
  , value => 'Freq=HOURLY;ByMinute=0'
  );
  dbms_output.put_line(v_job || '(re)created.');
EXCEPTION WHEN no_data_found THEN
  dbms_output.put_line('No Application '||v_appname||' found in workspace '||v_wrkspname||'. Job setup skipped.');
end;
/
prompt
