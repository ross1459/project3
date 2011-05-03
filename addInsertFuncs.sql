-- addInsertFuncs.sql - this script will make it easier to add users and suggestions
-- make sure that createTables.sql is run before this
-- create plpgsql language
drop language if exists plpgsql cascade;
create language plpgsql;
-- create function for adding a user and returning user id

create or replace function createUser(_name text, _username text, _password text)
returns integer as
$func$
begin
execute 'insert into users (name, username, password)' ||
'values (' || quote_literal(_name) || ',' || quote_literal(_username) || ',' 
|| quote_literal(_password) || ')';
return currval('user_id_seq');
end;
$func$
language 'plpgsql';

-- create function for adding questions and returning question id
create or replace function createQuestion(_question text)
returns integer as
$func$
begin
execute 'insert into questions (question)
values (' || quote_literal(_body) || ')';
return currval('question_id_seq');
end;
$func$
language 'plpgsql';
