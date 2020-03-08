CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE IF NOT EXISTS "students" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar, "password_digest" varchar, "email" varchar);
CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "assignments" ("id" integer NOT NULL PRIMARY KEY, "name" varchar DEFAULT NULL, "class_name" varchar DEFAULT NULL, "due_date" varchar DEFAULT NULL, "student_id" integer DEFAULT NULL, "stucla_id" integer);
CREATE TABLE IF NOT EXISTS "stuclas" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar);
INSERT INTO "schema_migrations" (version) VALUES
('20200307035305'),
('20200307035759'),
('20200308020310'),
('20200308020433');


