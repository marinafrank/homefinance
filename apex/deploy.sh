#!/bin/bash
#todo param dbdiff disable<a
set -x
LOG=deploy.log 
:>$LOG

_Log() {
  # write msg into log file and stdout
  echo "$*" | tee -a $LOG
}

TARGET_SCHEMA="HOMEFINANCE"
RUNSQL=$'sqlplus -s / as sysdba << EOF
  set heading off trimout on feedback off verify off pages 0\n
  spool $LOG append\n
  WHENEVER SQLERROR EXIT SQL.SQLCODE\n
  ALTER SESSION SET CURRENT_SCHEMA=$TARGET_SCHEMA;\n
  $SQLQUERY\n
  exit;\n
EOF'

DBDIFFLAST=$(ls -1 sql/dbdiff/* -t | head -n 1)

_Log "Deploying dbdiff $DBDIFFLAST..."

SQLQUERY="@$DBDIFFLAST"
eval "${RUNSQL}"

 "Deploying database API ..."
SQLLIST=$(ls -1 sql/05_api/*)
SQLQUERY=$(sed "s/^/@@/" <<< "$SQLLIST")
eval "${RUNSQL}"

_Log "Deploying APEX application ..."
# default workspace and app_id are defined inside each import script

RUNSQL=$'sqlplus  -s / as sysdba << EOF
  set serveroutput on\n 
  spool $LOG append\n
  exec apex_application_install.set_schema(\'$TARGET_SCHEMA\');\n
  $SQLQUERY\n
  exit;\n
EOF'

SQLLIST=$(ls -1 app/deploy/*)
SQLQUERY=$(sed "s/^/@@/" <<< "$SQLLIST")
eval "${RUNSQL}"
_Log "Homefinance deploy finished. See log $LOG"
