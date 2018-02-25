CREATE TABLE balance
(
  ID          NUMBER(2) NOT NULL,
  NAME        VARCHAR2(25 CHAR) NOT NULL,
  currency_id NUMBER(1) NOT NULL,
  opening     NUMBER(11,2) DEFAULT 0
);
ALTER TABLE balance
  ADD CONSTRAINT balance_pk PRIMARY KEY (ID);
