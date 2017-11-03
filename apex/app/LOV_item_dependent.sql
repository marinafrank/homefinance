-- P2_ACCOUNT_TOP_ID Accounts top level 
select padded_name, id
  from ACCOUNT_TOPLEVEL
 where op_direction in (:P2_OP_DIRECTION, 3)
-- P2_ACCOUNT_ID Accounts sublevel
select
  lpad(b.account_name,(lengthc(b.account_name)+(level-1)*4),'`') padded_name
, b.id ident
from balance_account b
where b.op_direction in (:P2_OP_DIRECTION, 3)
start with b.parent_id = :P2_ACCOUNT_TOP_ID
connect by prior b.id=b.parent_id
order siblings by account_name;
  
