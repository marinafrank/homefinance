create table FINANCE_OPERATIONS
(
  ID            NUMBER not null,
  IS_APPLIED    NUMBER(1) default 1 not null,
  OP_DATE       DATE not null,
  ACCNT         VARCHAR2(255 CHAR),
  COMMENTS      VARCHAR2(4000 CHAR),
  CUR_RATE_ID   NUMBER default 1 not null,
  CURRENCY_ID   NUMBER(1) default 1 not null,
  CONTRACTOR_ID NUMBER,
  BALANCE_ID    NUMBER(2) not null,
  OP_DIRECTION  NUMBER(1) not null,
  ACCOUNT_ID    NUMBER(3) not null,
  AMOUNT        NUMBER(15,2) not null,
  IS_STORNO     NUMBER(1)    default 0 not NULL
)
;
-- Create/Recreate primary, unique and foreign key constraints
alter table FINANCE_OPERATIONS
  add constraint FINANCE_OPERATIONS_PK primary key (ID);
alter table FINANCE_OPERATIONS
  add constraint FIN_OP_UK unique (OP_DATE, BALANCE_ID, ACCOUNT_ID, CONTRACTOR_ID, OP_DIRECTION);

alter table FINANCE_OPERATIONS
  add constraint date_chk check (OP_DATE > date '1984-11-16');
alter table FINANCE_OPERATIONS
  add constraint FIN_OP_ACC_FK foreign key (ACCOUNT_ID)
  references BALANCE_ACCOUNT (ID);
alter table FINANCE_OPERATIONS
  add constraint FIN_OP_APPL_FK foreign key (IS_APPLIED)
  references IS_APPL_LOOKUP (N);
alter table FINANCE_OPERATIONS
  add constraint FIN_OP_BALANCE_FK foreign key (BALANCE_ID)
  references BALANCE (ID);
alter table FINANCE_OPERATIONS
  add constraint FIN_OP_CONTR_FK foreign key (CONTRACTOR_ID)
  references CONTRACTOR (ID);
alter table FINANCE_OPERATIONS
  add constraint FIN_OP_CURR_RATE_FK foreign key (CUR_RATE_ID)
  references CURRENCY_RATE (ID);
alter table FINANCE_OPERATIONS
  add constraint FIN_OP_DIR_FK foreign key (OP_DIRECTION)
  references DIRECTION_LOOKUP (ID);

exec dbms_errlog.CREATE_ERROR_LOG ('FINANCE_OPERATIONS','FINANCE_OPERATIONS_ERR$')

TRIGGER "HOMEFINANCE".FINANCE_OPERATIONS_BIU_ACC_R
  before insert or update of account_id on FINANCE_OPERATIONS
  for each row
begin
  if not is_leaf_account(:new.account_id) then
    raise_application_error(-20002,'Нельзя назначить обобщающий счет');
  end if;

  hf_fin_oper.validate_direction(:NEW.account_id,:NEW.op_direction);

  if :new."ID" is null then
    if inserting then
      select "FINANCE_OPERATIONS_SEQ".nextval into :new."ID" from dual;
    end if;
  end if;

  if :new.CUR_RATE_ID is null AND :NEW.CURRENCY_ID=1 then
   :new.CUR_RATE_ID:=1;
  end if;
exception
when others then raise;
end;
