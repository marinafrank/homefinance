create or replace view account_toplevel as
select id, padded_name, op_direction
    , (select nvl(count(1),0) from balance_account b where b.parent_id = h.id) cnt
  from
(
  SELECT level lvl, b.op_direction, b.id
       , lpad(b.account_name,(lengthc(b.account_name)+(level-1)*4),'`') padded_name
    FROM balance_account b
   start with b.parent_id is null
   connect by prior b.id = b.parent_id
   order siblings by b.account_name
) h
WHERE h.lvl < 4
;