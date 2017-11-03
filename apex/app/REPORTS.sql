-- Report region
select OP_DATE,
       ACCOUNT_NAME,
       AMOUNT,
       CNTR_NAME,
       COMMENTS,
       BALANCE_NAME,
       CUR
  from FINANCE_OPERATIONS_ALL_V
 where op_date >= add_months(trunc(sysdate), -1) 
order by op_date desc, BALANCE_NAME, ACCOUNT_NAME, CNTR_NAME asc nulls first

-- chart: group by accounts for a given period
SELECT
    account_name,
    sum(amount) total
FROM
    homefinance.finance_operations_v f
WHERE f.op_direction = 1
  AND to_char(op_date,'yyyy-mm') = to_char(sysdate,'yyyy-mm')
GROUP BY account_name

SELECT
    account_name,
    sum(amount) total
FROM
    homefinance.finance_operations_v f
WHERE f.op_direction = 2
  AND to_char(op_date,'yyyy-mm') = to_char(sysdate,'yyyy-mm')
GROUP BY account_name

-- List view display column
select id
     , op_date||';'||
       rpad(balance_name,4,' ')||';'||
       rpad(account_name,10,' ')||';'||
       decode(op_direction,1,'-','+')||amount||cur||';'||
       rpad(cntr_name,4,' ')||';'
       --comments||';'
       displaycol
     , op_date
     , balance_name
     , account_name
     , amount
     , cur
     , cntr_name
     , op_direction
     , comments
  from "FINANCE_OPERATIONS_ALL_V" 