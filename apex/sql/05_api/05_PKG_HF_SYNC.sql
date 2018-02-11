create or replace package HF_SYNC is

  -- Author  : USER
  -- Created : 30.11.2014 10:02:15
  -- Purpose : 
  
 PROCEDURE download_xml;
 PROCEDURE download_csv( fieldSep varchar2 := ',');
 -- load data to the staging table from a given datasource
 -- dataSource: EXTERNALTAB, APEX
 PROCEDURE prepare_staging( dataSource varchar2, fieldSep varchar2 := ',', ops_staged out number);
 -- merge staging data into permanent table
 PROCEDURE import_staging( ops_imported out number, ops_failed out number, ops_noacc out number);

end HF_SYNC;
/
create or replace package body HF_SYNC is
PROCEDURE download_xml AS
        v_mime  VARCHAR2(48):= 'text\xml';
        v_length  NUMBER;
        v_blob  BLOB;
        v_clob CLOB;
        v_srcoffset INTEGER := 1;
        v_destoffset INTEGER := 1;
        v_lang INTEGER := DBMS_LOB.DEFAULT_LANG_CTX;
        v_warn INTEGER := DBMS_LOB.WARN_INCONVERTIBLE_CHAR;
BEGIN
  v_clob := hf_formatdata.FACT_AS_XML;
  DBMS_LOB.CREATETEMPORARY(lob_loc=>v_blob, cache=>TRUE);
  DBMS_LOB.CONVERTTOBLOB
  (
   dest_lob    =>v_blob,
   src_clob    =>v_clob,
   amount      =>DBMS_LOB.LOBMAXSIZE,
   dest_offset =>v_srcoffset,
   src_offset  =>v_destoffset,
   blob_csid   =>DBMS_LOB.DEFAULT_CSID,
   lang_context=>v_lang,
   warning     =>v_warn
  );
  
  v_length := DBMS_LOB.GETLENGTH(v_blob);
-- set up HTTP header
  owa_util.mime_header( v_mime, FALSE );
 
  -- set the size so the browser knows how much to download
  htp.p('Content-length: ' || v_length);
  -- the filename will be used by the browser if the users does a save as
  htp.p('Content-Disposition:  attachment; filename="hf_full_'||to_char(SYSDATE,'YYYYMMDDHH24:MI:SS')||'.xml"');
  -- close the headers            
  owa_util.http_header_close;
  -- download the BLOB
  wpg_docload.download_file( v_blob );
END download_xml;

PROCEDURE download_csv( fieldSep varchar2 := ',') is
begin
  null;
end;

PROCEDURE prepare_staging( dataSource varchar2, fieldSep varchar2 := ',', ops_staged out number) IS
  pragma autonomous_transaction;
BEGIN
  delete FINANCE_OPERATIONS_ERR$;
  delete finop_staging;
  ops_staged := sql%rowcount;
  IF dataSource = 'EXTERNALTAB' THEN
    -- todo (re)create exttab
    insert into finop_staging select * from finop_external;
    ops_staged := sql%rowcount;
  ELSIF dataSource = 'APEX' THEN
    null;
  END IF;
  commit;
END prepare_staging;

PROCEDURE import_staging( ops_imported out number, ops_failed out number, ops_noacc out number) IS
BEGIN
  --delete FINANCE_OPERATIONS_ERR$;
  ops_imported := 0;
  -- merge staging records: insert non-existing, update existing.
  -- if default account found, save old data in comments for manual check
  execute immediate 'ALTER SESSION SET NLS_NUMERIC_CHARACTERS=''. ''';
  merge into finance_operations d USING finop_staging_mapped s
  on (    d.OP_DATE        = s.OP_DATE      
      and d.BALANCE_ID     = s.BALANCE_ID   
      and d.ACCOUNT_ID     = s.ACCOUNT_ID  
      and (d.CONTRACTOR_ID  = s.CONTRACTOR_ID or COALESCE( d.CONTRACTOR_ID, s.CONTRACTOR_ID) is NULL)
      and d.OP_DIRECTION   = s.OP_DIRECTION 
	 )
  when matched then
  update set d.amount = s.amount
   -- string overflow is not handled intentionally to be propagated to caller with rollback  
   , d.comments = case when d.ACCOUNT_ID=HF_FORMATDATA.dflt_account_id and s.ACCOUNT_ID=HF_FORMATDATA.dflt_account_id then
       'WARN: possible data loss new amount:'||s.amount|| ' old amount:'||d.amount||
       ' newCommment:'||s.comments||' oldComment:'||d.comments
     else s.comments end
  where d.amount != s.amount
     or not (d.comments = s.comments or COALESCE( d.comments, s.comments) is NULL)
  when not matched then
  INSERT (
    op_date,
    comments,
    currency_id,
    contractor_id,
    balance_id,
    op_direction,
    account_id,
    amount
  )
  values
  ( s.op_date,
    s.comments,
    s.currency_id,
    s.contractor_id,
    s.balance_id,
    s.op_direction,
    s.account_id,
    s.amount
  )
  log errors into FINANCE_OPERATIONS_ERR$ reject limit unlimited;
  
  ops_imported := sql%rowcount;
  
  select count(1) into ops_failed from FINANCE_OPERATIONS_ERR$;
  
  IF ops_failed > 0 then
    ops_imported := 0;
    rollback;
  ELSE
    select count(1) into ops_noacc
      from finance_operations
     where op_date >= (select min(op_date) from finop_staging)
       and account_id = HF_FORMATDATA.dflt_account_id
     order by op_date;
  END IF;

END import_staging;
END;
/
show errors