create or replace package HF_SYNC is

  -- Author  : USER
  -- Created : 30.11.2014 10:02:15
  -- Purpose : 
  
 PROCEDURE download_xml;

end HF_SYNC;
/
create or replace package body HF_SYNC is

PROCEDURE download_xml AS
        v_mime  VARCHAR2(48):= 'text\xml';
        v_length  NUMBER;
        Lob_loc  CLOB;
BEGIN
  
  Lob_loc := hf_formatdata.FACT_AS_XML;
  v_length := DBMS_LOB.GETLENGTH(Lob_loc);
-- set up HTTP header
  owa_util.mime_header( v_mime, FALSE );
 
  -- set the size so the browser knows how much to download
  htp.p('Content-length: ' || v_length);
  -- the filename will be used by the browser if the users does a save as
  htp.p('Content-Disposition:  attachment; filename="hf_full_'||to_char(SYSDATE,'YYYYMMDDHH24:MI:SS')||'.xml"');
  -- close the headers            
  owa_util.http_header_close;
  -- download the BLOB
  wpg_docload.download_file( Lob_loc );
END download_xml;
END;
/
