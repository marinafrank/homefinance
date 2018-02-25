#!/bin/bash
#todo param dbdiff disable<a
TARGET_SCHEMA="HOMEFINANCE"
RUNSQL=$'sqlplus  -s "/ as sysdba" << EOF
  set heading off trimout on feedback off verify off pages 0\n
  WHENEVER SQLERROR EXIT SQL.SQLCODE\n
  ALTER SESSION SET CURRENT_SCHEMA=$TARGET_SCHEMA;\n
  $SQLQUERY\n
  exit;\n
EOF'

DBDIFFLAST=`ls sql/dbdiff -t | head -n 1`

echo "Deploying dbdiff $DBDIFFLAST..."

SQLQUERY=$@'
eval RUNRESULT="${RUNSQL}"

echo "Deploying database API ..."
eval RUNRESULT="${RUNSQL}"

echo "Deploying APEX application ..."



