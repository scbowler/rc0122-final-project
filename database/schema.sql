set client_min_messages to warning;

-- DANGER: this is NOT how to do it in the real world.
-- `drop schema` INSTANTLY ERASES EVERYTHING.
drop schema "public" cascade;

create schema "public";

CREATE TABLE "users" (
	"userId" serial NOT NULL,
	"firstName" TEXT NOT NULL,
	"lastName" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	"createdAt" timestamptz NOT NULL default now(),
	CONSTRAINT "users_pk" PRIMARY KEY ("userId")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "entries" (
	"entryId" serial NOT NULL,
	"title" TEXT NOT NULL,
	"photoUrl" TEXT NOT NULL,
	"notes" TEXT NOT NULL,
	"createdAt" timestamptz NOT NULL default now(),
	"userId" integer NOT NULL,
	CONSTRAINT "entries_pk" PRIMARY KEY ("entryId")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "comments" (
	"commentId" serial NOT NULL,
	"entryId" integer NOT NULL,
	"userId" integer NOT NULL,
	"comment" TEXT NOT NULL,
	"createdAt" timestamptz NOT NULL default now(),
	CONSTRAINT "comments_pk" PRIMARY KEY ("commentId")
) WITH (
  OIDS=FALSE
);

ALTER TABLE "entries" ADD CONSTRAINT "entries_fk0" FOREIGN KEY ("userId") REFERENCES "users"("userId");
ALTER TABLE "comments" ADD CONSTRAINT "comments_fk0" FOREIGN KEY ("entryId") REFERENCES "entries"("entryId");
ALTER TABLE "comments" ADD CONSTRAINT "comments_fk1" FOREIGN KEY ("userId") REFERENCES "users"("userId");
