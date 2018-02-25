create table CONTRACTOR
(
  id        NUMBER not null,
  cntr_name VARCHAR2(30 CHAR) not null,
  grp       VARCHAR2(25 CHAR),
  end_date  DATE
)
alter table CONTRACTOR
  add constraint CONTRACTOR_PK primary key (ID);
