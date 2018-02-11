create or replace package HF_FORMATDATA is

  -- Author  : USER
  -- Created : 30.11.2014 9:43:38
  -- Purpose : 
  c_dflt_account_id finance_operations.account_id%type := 62;
  FUNCTION FACT_AS_XML return CLOB;
  function dflt_account_id return finance_operations.account_id%type;
end;
/
create or replace package body HF_FORMATDATA is
  FUNCTION FACT_AS_XML return CLOB IS
    l_xmltype XMLTYPE;
  BEGIN
    l_xmltype := dbms_xmlgen.getxmltype('select id, is_applied, op_date, accnt, ' ||
    'comments, cur_rate_id, currency_id, contractor_id, balance_id, op_direction, ' ||
    'account_id, amount from finance_operations ' ||
    'order by op_date, balance_id, account_id, contractor_id, op_direction'
    );  

    return l_xmltype.getClobVal;
  END FACT_AS_XML;
  
  function dflt_account_id return finance_operations.account_id%type is
  begin
    return c_dflt_account_id;
  end dflt_account_id;
  
end;
/
show errors
