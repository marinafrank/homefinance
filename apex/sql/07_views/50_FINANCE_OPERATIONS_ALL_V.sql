CREATE OR REPLACE VIEW HOMEFINANCE.FINANCE_OPERATIONS_ALL_V AS
SELECT f.id
     , 1 oper_type
     , f.op_date
     , ba.account_name
     , decode(f.op_direction,1,f.amount,0) EXP
     , decode(f.op_direction,2,f.amount,0) inc
     , comments
     , c.short_name cur
     , c.id cur_id
     , cr.rate
     , cn.cntr_name
     , f.contractor_id
     , b.name balance_name
     , f.balance_id, f.account_id, f.amount, f.op_direction, f.is_storno
  FROM finance_operations f
     , balance_account ba
     , balance b
     , currency c
     , currency_rate cr
     , contractor cn
where ba.id=f.account_id
  and b.id=f.balance_id
  and c.id=f.currency_id
  and cr.id=f.cur_rate_id
  and cn.id(+)=f.contractor_id
UNION ALL
SELECT bt.id,2,bt.tr_date,'Перевод'
     , decode(bt.op_direction,1,bt.amount,0) EXP
     , decode(bt.op_direction,2,bt.amount,0) inc
     , NULL comments
     , c.short_name cur
     , c.id cur_id
     , cr.rate
     , NULL, NULL
     , b.name
     , bt.bal_id, NULL, bt.amount,bt.op_direction, 0
  FROM (SELECT id,bal_id,op_direction,tr_date,amount,currency_id,curr_rate_id
          FROM (SELECT id,tr_date,amount,currency_id,curr_rate_id,src_id,1 src_dir,dest_id,2 dest_dir
                  FROM balance_transfer)
       UNPIVOT ((bal_id,op_direction) FOR (bal,dir) IN ((src_id,src_dir),(dest_id,dest_dir)))
       ) bt
     , balance b
     , currency c
     , currency_rate cr
 WHERE bt.bal_id = b.id
   AND bt.currency_id = c.id
   AND bt.curr_rate_id = cr.id;
