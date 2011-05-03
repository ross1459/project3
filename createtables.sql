-- createTables.sql
-- creates basic table structure to be used in the database

-- create sequences
drop sequence if exists user_id_seq cascade;
create sequence user_id_seq;

drop sequence if exists survey_id_seq cascade;
create sequence survey_id_seq;

drop sequence if exists question_id_seq cascade;
create sequence question_id_seq;

drop sequence if exists answer_id_seq cascade;
create sequence answer_id_seq;

--create tables
drop table if exists users cascade;
create table users(
  id integer not null primary key default nextval('user_id_seq'),
  name text,
  username text unique,
  password text,
  enc_pass text,
  salt text
);
drop table if exists surveys cascade;
create table surveys(
  s_id integer not null primary key default nextval('survey_id_seq'),
  name text,
  owner integer not null references users(id),
  created_at timestamp,
  updated_at timestamp
);
drop table if exists questions cascade;
create table questions(
  q_id integer not null primary key default nextval('question_id_seq'),
  s_id integer references surveys(s_id),
  question text
);
drop table if exists answers cascade;
create table answers(
  a_id integer not null primary key default nextval('answer_id_seq'),
  q_id integer references questions(q_id),
  answer boolean
);
-- create views
-- users_view -a view to select all from users
--drop view if exists users_view cascade;
--create view users_view as
--  select users.id as userid,users.name,users.username
--  from users
--  ;
  
--survey_question_view -a view to select all from surveys and questions 
--(display survey with questions)
--drop view if exists survey_question_view cascade;
--create view survey_question_view as
--  select surveys.s_id as surveyId, surveys.name,surveys.owner,
--questions.q_id as questId,questions.question
--  from surveys, questions
--  join questions on surveys.s_id=questions.s_id 
  ;
--sugg_author_view -a view to show suggestions and authors
--drop view if exists sugg_user_view cascade;
--create view sugg_user_view as
  --select users.id as userid,users.name,users.department,users.division, 
  --users.username, suggestions.id as suggid,suggestions.body,
  --suggestions.created_at,suggestions.updated_at
  --from users 
  --join users_suggestions on users.id=users_suggestions.user_id
  --join suggestions on users_suggestions.suggestions_id=suggestions.id;
