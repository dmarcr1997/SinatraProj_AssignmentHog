CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "students" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar, "password_digest" varchar, "email" varchar);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE IF NOT EXISTS "assignments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "class_name" varchar, "due_date" varchar, "student_id" integer);
INSERT INTO "schema_migrations" (version) VALUES
('20200307035305'),
('20200307035759');


