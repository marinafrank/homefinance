-- accounts
SELECT
    padded_name,
    ident
FROM
    accounts_hierarch;
-- balance    
SELECT
    name,
    id
FROM
    balance
ORDER BY 1
-- contragents
SELECT
    cntr_name,
    id
FROM
    contractor
ORDER BY 1;
-- currency
select short_name
     , id
  from currency
 order by 1