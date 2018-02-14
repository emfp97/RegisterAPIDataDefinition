--The beginning of the SQL for the  employee database. Not completed, could use some help
CREATE EXTENSION pgcrypto; --Allows PostgreSQL to understand UUIDs. Only have to create the extension once for a database.

--DROP TABLE employee;

CREATE TABLE employee (
  ID uuid NOT NULL DEFAULT gen_random_uuid(),
  firstName character varying(32) NOT NULL DEFAULT(''),
  lastName character varying(32) NOT NULL DEFAULT(''),
  employeeID character varying(32) NOT NULL DEFAULT(''),
  active character varying(32) NOT NULL DEFAULT(''),
  CONSTRAINT chk_active CHECK (active IN ('Active', 'Inactive')),
  role character varying(32) NOT NULL DEFAULT(''),
  CONSTRAINT chk_role CHECK (role IN ('General Manager', 'Shift Manager', 'Cashier')),
  manager ,
  password character varying(32) NOT NULL DEFAULT('')
  createdon timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT employee_pkey PRIMARY KEY (ID)
) WITH (
  OIDS=FALSE
);

--DROP INDEX ix_employee_lookupcode;

CREATE INDEX ix_employee_lookupcode
  ON employee
  USING btree
  (lower(lookupcode::text) COLLATE pg_catalog."default");

INSERT INTO employee (lookupcode, count) VALUES (
       'lookupcode1'
     , 100)
RETURNING ID, createdon;

INSERT INTO employee (lookupcode, count) VALUES (
       'lookupcode2'
     , 125)
RETURNING ID, createdon;

INSERT INTO employee (lookupcode, count) VALUES (
       'lookupcode3'
     , 150)
RETURNING ID, createdon;

--SELECT * FROM employee;

--DELETE FROM employee;

