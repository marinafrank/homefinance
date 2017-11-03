CREATE OR REPLACE VIEW FINOP_STAGING_MAPPED
AS
SELECT
    op_date,
    replace( amount, ',', '.') amount,
    nvl(balance_id,1) balance_id,
    contractor_id,
    nvl(account_id,62) account_id,
    comments,
    nvl(op_direction, 1) op_direction,
    nvl(currency_id, 3) currency_id
FROM
    homefinance.finop_staging;
