-- Table Members is to record member information.
CREATE TABLE IF NOT EXISTS "Members" (
  "id" INTEGER,
  "account" VARCHAR(180) NOT NULL UNIQUE,
  "email" VARCHAR(180) NOT NULL UNIQUE,
  "birth" VARCHAR(50),
  "height" float,
  "weight" float,
  PRIMARY KEY("id")
);

-- Table of Favorites is to record what member like,just like a bookmark.
CREATE TABLE IF NOT EXISTS "Favorites"(
  "id" INTEGER,
  "members_id" INTEGER NOT NULL,
  "videos_id" INTEGER NOT NULL,
  "watch_status" BOOLEAN NOT NULL DEFAULT false
  "date" timestamptz,
  PRIMARY KEY("id"),
  FOREIGN KEY("members_id") REFERENCES "Members"("id"),
  FOREIGN KEY("videos_id") REFERENCES "Exercise_videos"("id")
);

-- Table Members_milestones is achievement of member.
CREATE TABLE IF NOT EXISTS "Members_milestones"(
  "id" INTEGER,
  "members_id" INTEGER NOT NULL,
  "milestones_id" INTEGER NOT NULL,
  "date" timestamptz default now,
  PRIMARY KEY("id"),
  FOREIGN KEY("members_id") REFERENCES "Members"("id"),
  FOREIGN KEY("milestones_id") REFERENCES "Milestones"("id")
);

-- Table Milestones is to record different times of exercise.
CREATE TABLE IF NOT EXISTS "Milestones" (
  "id" INTEGER,
  "milestones_name" VARCHAR(180) NOT NULL UNIQUE,
  "frequency" INTEGER,
  PRIMARY KEY("id")
);

-- Table Exercise_levels has different type of exercise intensity.
CREATE TABLE IF NOT EXISTS "Exercise_levels"(
  "id" INTEGER,
  "level" VARCHAR(180) NOT NULL,
  PRIMARY KEY("id")
);

-- Table Exercise_videos is to record url of videos.
CREATE TABLE IF NOT EXISTS "Exercise_videos"(
  "id" INTEGER ,
  "title" text NOT NULL,
  "url" text NOT NULL,
  "level_id" INTEGER NOT NULL,
  PRIMARY KEY("id"),
  FOREIGN KEY("level_id") REFERENCES "Exercise_levels"("id")
);

-- comments on columns of different tables.
COMMENT ON COLUMN "Members".height IS 'CM';
COMMENT ON COLUMN "Members".weight IS 'KG';
COMMENT ON COLUMN "Exercise_levels".level IS 'exercise intensity(Easy,Mid,Hard)';
COMMENT ON COLUMN "Favorites".watch_status IS 'default false';

-- View : member_history. History of a user what they have done.
CREATE VIEW member_history (members_id,projects_id,watch_at)
AS
	SELECT
		m.id,p.id,p.date
	FROM "Members" AS m
	JOIN "Favorites" AS p
	ON m.id = p.members_id
	WHERE p.watch_status = true;

-- Index
CREATE INDEX account ON "Members"(account);
CREATE INDEX email ON "Members"(email);
CREATE INDEX title ON "Exercise_videos"(title);
CREATE INDEX milestones_name ON "Milestones" (milestones_name);
