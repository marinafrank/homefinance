CREATE OR REPLACE PACKAGE hf_stammdata IS

  -- author  : marinf
  -- created : 15.02.2018 12:09:38
  -- purpose :

  PROCEDURE upsert_acc
  ( v_id IN OUT balance_account.id%TYPE
  , v_parent_id balance_account.parent_id%TYPE
  , v_account_name balance_account.account_name%TYPE
  , v_end_date balance_account.end_date%TYPE
  , v_op_direction balance_account.op_direction%TYPE);

  PROCEDURE del_acc
  ( v_id balance_account.id%TYPE);

END;
/
CREATE OR REPLACE PACKAGE BODY hf_stammdata IS
  PROCEDURE upsert_acc
  ( v_id IN OUT balance_account.id%TYPE
  , v_parent_id balance_account.parent_id%TYPE
  , v_account_name balance_account.account_name%TYPE
  , v_end_date balance_account.end_date%TYPE
  , v_op_direction balance_account.op_direction%TYPE) IS
  BEGIN
    IF v_id IS NULL THEN
      v_id := account_seq.nextval;
      BEGIN
        INSERT INTO balance_account
          (id, parent_id, account_name, end_date, op_direction)
        VALUES
          (v_id, v_parent_id, v_account_name, v_end_date, v_op_direction);
      EXCEPTION WHEN dup_val_on_index THEN
        raise_application_error(-20001, 'Account with id='||v_id||' already exists.');
      END;
    ELSE
      -- update
      UPDATE balance_account ba
         SET ba.parent_id = v_parent_id,
             ba.account_name = v_account_name,
             ba.end_date = v_end_date,
             ba.op_direction = v_op_direction
       WHERE id = v_id;
    END IF;
  END upsert_acc;

  PROCEDURE del_acc
  ( v_id balance_account.id%TYPE) IS
  BEGIN
    DELETE balance_account ba
     WHERE ba.id = v_id;
  END del_acc;

END;
/
