create user homefinance identified by values '0' default tablespace users quota unlimited on users;
grant resource to homefinance;

create or replace directory hf_incoming as 'd:\ORACLE\hf';
grant read,write on directory hf_incoming to homefinance;