create or replace package HF_FORMATDATA is

  -- Author  : USER
  -- Created : 30.11.2014 9:43:38
  -- Purpose : 
  c_dflt_account_id finance_operations.account_id%type := 62;
  eStrVarTooSmall EXCEPTION;
  eInvalChar EXCEPTION;
  eInvalIdent EXCEPTION; 
  PRAGMA EXCEPTION_INIT(eStrVarTooSmall, -06502);
  PRAGMA EXCEPTION_INIT(eInvalChar, -00911);
  PRAGMA EXCEPTION_INIT(eInvalIdent, -00904);

  FUNCTION FACT_AS_XML return CLOB;
  function dflt_account_id return finance_operations.account_id%type;
  -- FUNCTION calculate_math accepts string mathematical expression and returns calculated result
  -- thousand group separators are not expected
  -- comma decimal separator is replaced to dot
  -- blanks are ignored
  FUNCTION calcMath(pExpr VARCHAR2) RETURN NUMBER;
end;
/
CREATE OR REPLACE PACKAGE BODY HF_FORMATDATA IS
  FUNCTION FACT_AS_XML RETURN CLOB IS
    l_xmltype XMLTYPE;
  BEGIN
    l_xmltype := dbms_xmlgen.getxmltype('select id, is_applied, op_date, accnt, ' ||
    'comments, cur_rate_id, currency_id, contractor_id, balance_id, op_direction, ' ||
    'account_id, amount from finance_operations ' ||
    'order by op_date, balance_id, account_id, contractor_id, op_direction'
    );  

    RETURN l_xmltype.getClobVal;
  END FACT_AS_XML;
  
  FUNCTION dflt_account_id RETURN finance_operations.account_id%TYPE IS
  BEGIN
    RETURN c_dflt_account_id;
  END dflt_account_id;
  
  FUNCTION calcMath(pExpr VARCHAR2) RETURN NUMBER IS
    vNormExpr VARCHAR2(4000) := translate(pExpr,',= ','.');
    vRes      NUMBER;
  BEGIN
    EXECUTE IMMEDIATE 'select '||vNormExpr||' from dual'
       INTO vRes;
    RETURN vRes;
  EXCEPTION
    WHEN eStrVarTooSmall THEN
      raise_application_error(-20001, 'Math expression '||substr(pExpr,1,30)||' exceeds 4000 chars');
    WHEN eInvalChar OR eInvalIdent THEN
      raise_application_error(-20001, 'Math expression '||vNormExpr||' contains invalid symbols');
  END calcMath;
END;
/
show errors
