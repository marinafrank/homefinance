CREATE TABLE balance_account
(
  ID           NUMBER NOT NULL,
  parent_id    NUMBER,
  account_name VARCHAR2(40 CHAR) NOT NULL,
  end_date     DATE,
  op_direction NUMBER(1)
);
ALTER TABLE balance_account
  ADD CONSTRAINT account_pk PRIMARY KEY (ID);
ALTER TABLE balance_account
  ADD CONSTRAINT account_par_fk FOREIGN KEY (parent_id)
  REFERENCES balance_account (ID) ON DELETE CASCADE;
ALTER TABLE balance_account
  ADD CONSTRAINT bal_acc_dir_fk FOREIGN KEY (op_direction)
  REFERENCES direction_lookup (ID);

CREATE SEQUENCE account_seq
START WITH 1
INCREMENT BY 1
CACHE 2;

TRIGGER "HOMEFINANCE".balance_account_BIR
  before insert on balance_account
  for each row
begin
  if :new."ID" is null then
    select ACCOUNT_SEQ.nextval into :new."ID" from dual;
  end if;
exception
  when others then raise;
end;
