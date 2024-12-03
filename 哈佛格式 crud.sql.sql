-- Show members whose height > 170.
SELECT * FROM "Members" WHERE height > 170;
-- Show all informations whose account is 'example_member2'.
SELECT * FROM "Members" WHERE account = 'example_member2';

-- Use join to combine 2 tables,based on Exercise_levels' id and Exercise_videos' id.
-- Show title,path of Exercise_videos and level of Exercise_levels.
SELECT
	ev.title,ev.url,el.level
FROM "Exercise_videos" AS ev
JOIN "Exercise_levels" AS el
ON el.id = ev.level_id;

--  Count how many projects do a member have.
Select
	m.id,
	m.account,
	count(p.members_id) As bookmark_number
From "Projects" As p
Left Join "Members" As m
ON p.members_id = m.id
Group By m.id,m.account
Order By m.id ASC;

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
INSERT INTO "Exercise_levels" (id,level) VALUES
(1,'Easy'),(2,'Mid'),(3,'Hard');

-- Insert Members_milestones.
WITH c AS (
	SELECT
		m.id As m_id,m.account,
		case
			when
				count(mh.members_id) >= 3 and count(mh.members_id) < 4
				then 1
			when
				count(mh.members_id) >= 4 and count(mh.members_id) < 5
				then 3
			when
				count(mh.members_id) >= 5 and count(mh.members_id) < 6
				then 2
			when
				count(mh.members_id) >= 6 and count(mh.members_id) < 7
				then 4
			when
				count(mh.members_id) >= 7
				then 5
		end as milestones_id
	FROM "Members" as m
		LEFT JOIN member_history as mh
			ON m.id = mh.members_id
			WHERE mh.watch_at >= NOW() - INTERVAL '7 DAYS'
	GROUP BY m.id
)
Insert Into "Members_milestones" (members_id,milestones_id)
select m_id,milestones_id from c where c.milestones_id is not null;


-- Insert Exercise_videos.
INSERT INTO "Exercise_videos" (id,title,url,level_id) VALUES
(1,'5 minutes workout','https://www.youtube.com/shorts/YEyFrfetw42f',1),(2,'20 MIN CARDIO HIIT WORKOUT','https://www.youtube.com/watch?RJRITGJ4dgrip2w6-freg',3),
(3,'30 minutes workout','https://www.youtube.com/watch?v=RJRITGJ4dgrip2w6',3),(4,'10 minutes workout','https://www.youtube.com/watch?v=ntHn9RfP_RJRITGJ4dgrip2w6',2),
(5,'10 Minute Ab Workout','https://www.youtube.com/watch?v=IrA9dvJ4dgrip2w6',3);

-- Insert Projects.
INSERT INTO "Projects" (id,members_id,videos_id,date) VALUES
(1,2,1,now()),(2,2,4,now()),(3,2,5,now()),(4,3,1,now()),(5,2,4,now()),(6,2,1,now());


--- Update weight of member whose id is 2.
UPDATE "Members" SET weight = 65 WHERE id = 2;

-- Update watch_status and date when member have seen the project.
UPDATE "Projects" SET watch_status = 1 ,date = now() WHERE id = 4;

--- Delete from table where id = ?
DELETE FROM "Exercise_videos" WHERE id = 2;
DELETE FROM "Members" WHERE id = 2;
