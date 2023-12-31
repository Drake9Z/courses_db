CREATE TABLE "courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "course_title" varchar(30) NOT NULL,
  "course_description" varchar(70) NOT NULL,
  "level_id" int NOT NULL,
  "category_id" int NOT NULL,
  "teacher_id" int NOT NULL
);

CREATE TABLE "levels" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "level" varchar(10) NOT NULL
);

CREATE TABLE "categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "category" varchar(10) UNIQUE NOT NULL
);

CREATE TABLE "courses_per_student" (
  "cps_id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "course_id" int NOT NULL,
  "student_id" int NOT NULL
);

CREATE TABLE "videos" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar(30) UNIQUE NOT NULL,
  "url" varchar(50) UNIQUE NOT NULL,
  "course_id" int NOT NULL
);

CREATE TABLE "users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(50) NOT NULL,
  "email" varchar(30) UNIQUE NOT NULL,
  "password" varchar(12),
  "age" int NOT NULL,
  "role_id" int NOT NULL
);

CREATE TABLE "roles" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "role" varchar(10) UNIQUE NOT NULL
);

ALTER TABLE "levels" ADD FOREIGN KEY ("id") REFERENCES "courses" ("level_id");

ALTER TABLE "categories" ADD FOREIGN KEY ("id") REFERENCES "courses" ("category_id");

ALTER TABLE "users" ADD FOREIGN KEY ("id") REFERENCES "courses" ("teacher_id");

ALTER TABLE "courses_per_student" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses_per_student" ADD FOREIGN KEY ("student_id") REFERENCES "users" ("id");

ALTER TABLE "videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "roles" ADD FOREIGN KEY ("id") REFERENCES "users" ("role_id");
