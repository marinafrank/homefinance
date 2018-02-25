CREATE TABLE direction_lookup
(
  ID   NUMBER(1) NOT NULL,
  NAME VARCHAR2(10 CHAR)
);
ALTER TABLE direction_lookup
  ADD CONSTRAINT dir_lookup_pk PRIMARY KEY (ID);
