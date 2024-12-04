-- Insert Members.
INSERT INTO "Members" (id,account,email,birth,height,weight) VALUES
(1,'example_member1','eg1email@mail.com','1982-12-01',162.5,42),
(2,'example_member2','eg2email@mail.com','1972-03-21',176.5,62.8),
(3,'example_member3','eg3email@mail.com','1982-04-11',155.3,72),
(4,'example_member4','eg4email@mail.com','1982-07-11',182.6,81);

-- Insert Milestones.
INSERT INTO "Milestones" (id,milestones_name,frequency) VALUES
(1,'3 times a week',3),(2,'5 times a week',5),(3,'4 times a week',4),
(4,'6 times a week',6),(5,'7 times a week',7);

-- Insert Exercise_levels.
INSERT INTO "Exercise_levels" (id,level) VALUES (1,'Easy'),(2,'Mid'),(3,'Hard');

-- Insert Members_milestones.
WITH c AS (
	SELECT
		m.id AS m_id,m.account,
		CASE
			WHEN
				count(mh.members_id) >= 3 AND count(mh.members_id) < 4
				THEN 1
			WHEN
				count(mh.members_id) >= 4 AND count(mh.members_id) < 5
				THEN 3
			WHEN
				count(mh.members_id) >= 5 AND count(mh.members_id) < 6
				THEN 2
			WHEN
				count(mh.members_id) >= 6 AND count(mh.members_id) < 7
				THEN 4
			WHEN
				count(mh.members_id) >= 7
				THEN 5
		END AS milestones_id
	FROM "Members" AS m
		LEFT JOIN member_history AS mh
			ON m.id = mh.members_id
			WHERE mh.watch_at >= datetime('now' , '-7 days')
	GROUP BY m.id
)
INSERT INTO "Members_milestones" (members_id,milestones_id)
SELECT m_id,milestones_id FROM c WHERE c.milestones_id IS NOT NULL;


-- Insert Exercise_videos.
INSERT INTO "Exercise_videos" (id,title,url,level_id) VALUES
(1,'5 minutes workout','https://www.youtube.com/shorts/YEyFrfetw42f',1),(2,'20 MIN CARDIO HIIT WORKOUT','https://www.youtube.com/watch?RJRITGJ4dgrip2w6-freg',3),
(3,'30 minutes workout','https://www.youtube.com/watch?v=RJRITGJ4dgrip2w6',3),(4,'10 minutes workout','https://www.youtube.com/watch?v=ntHn9RfP_RJRITGJ4dgrip2w6',2),
(5,'10 Minute Ab Workout','https://www.youtube.com/watch?v=IrA9dvJ4dgrip2w6',3);

-- Insert Favorites.
INSERT INTO "Favorites" (id,members_id,videos_id,date) VALUES (1,2,1,datetime()),(2,2,4,datetime()),(3,2,5,datetime()),(4,3,1,datetime()),(5,2,4,datetime()),(6,2,1,datetime());

-- Show members whose height > 170.
SELECT * FROM "Members" WHERE height > 170;
-- Show all informations whose account is 'example_member2'.
SELECT * FROM "Members" WHERE account = 'example_member2';

-- Use join to combine 2 tables,based on Exercise_levels' id and Exercise_videos' id.
-- Show title,path of Exercise_videos and level of Exercise_levels.
SELECT ev.title,ev.url,el.level FROM "Exercise_videos" AS ev
JOIN "Exercise_levels" AS el ON el.id = ev.level_id;

--  Count how many Favorites do a member have.
SELECT
	m.id,
	m.account,
	count(fav.members_id) AS bookmark_number
FROM "Favorites" AS fav
LEFT JOIN "Members" AS m
ON fav.members_id = m.id
GROUP BY m.id,m.account
ORDER BY m.id ASC;

--- Show account and what milestones do members have.
SELECT
	m.id AS m_id,
	m.account,
	m2.frequency AS exercise_frequency,
	m2.milestones_name
FROM "Members_milestones" AS m1
JOIN "Members" AS m
ON m.id = m1.members_id
JOIN "Milestones" AS m2
ON m2.id = m1.milestones_id;

--- How many times do members exercise in last 7 days.
WITH c AS (
	SELECT
		m.id AS m_id,m.account,
		count(mh.members_id) AS exercise_frequency
	FROM "Members" AS m
		LEFT JOIN member_history AS mh
			ON m.id = mh.members_id
			WHERE mh.watch_at >= datetime('now' , '-7 days')
	GROUP BY m.id
)
SELECT m_id,account,exercise_frequency FROM c;

--- Update weight of member whose id is 2.
UPDATE "Members" SET weight = 65 WHERE id = 2;

-- Update watch_status and date when member have seen.
UPDATE "Favorites" SET watch_status = 1 ,date = datetime() WHERE id = 4;

--- Delete from table where id = ?
DELETE FROM "Exercise_videos" WHERE id = 2;
DELETE FROM "Members" WHERE id = 2;
