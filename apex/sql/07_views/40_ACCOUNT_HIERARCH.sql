CREATE OR REPLACE VIEW ACCOUNTS_HIERARCH
AS
select
  level uroven
, b.id ident
, b.parent_id parent
, lpad(b.account_name,(lengthc(b.account_name)+(level-1)*4),'`') padded_name
, b.op_direction
, b.account_name
from balance_account b
start with b.parent_id is null
connect by prior b.id=b.parent_id
order siblings by account_name;
