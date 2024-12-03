# Design Document

By Mavis Lai

Video overview: <URL HERE>

## Purpose
This database is design for people who want to exercise for healthy or keep good shape of their body.

**In Scope**
Do some exercise at home and don't need professional equipments.
* Members: This table is to record member information, including account, birthday, email, height and weight.
* Exercises_levels: This table has different type of exercise intensity.There're 3 types of levels,like "easy","mid" and "hard".
* Exercide_videos: This table is to record url of videos and the column level_id is refers to the PRIMARY KEY in Exercise_levels table.
* Favorites: This table is a record of member what they like.Maybe they will watch video in the future,just like a bookmark.
* Members_milestones: This table is to record a member times of exercise.
* Milestones: This table is to record different times of exercise.

**Out of Scope**
Eat a lot or lazy in life.

## Scope

The purpose of my database is to design for anyone who want to do some exercise at home.But People who is physical impairment or do not have enough spaces to do it.

## Functional Requirements
 * CRUD for members.
 * Members can choose which videos they want to exercise based on their abilities or preferences.

 Whether a member can lose the desired weight, exercise regularly, and eat a healthy diet are factors that the database cannot control.

## Representation
### Entities

#### Members:
the `Members` table includes:
* `id` which is a `Primary Key`, `unique` number assigned to each member in the database.And the id is incresement.
* `account` is a `unique` `varchar` to represent the member account of the database.
* `email` which is a `unique` `varchar` to get more information.
* `birth` is type of `varchar`,which mean the member's birthday,to know their ages.
* `height` is type of `varchar`,whichis to get more suitable exercise plan for the member,need height,weight and age to accurate of calories and exercise volume.
* `weight` is type of `varchar`,whichis to get more suitable exercise plan for the member,need height,weight and age to accurate of calories and exercise volume.
#### Milestones:
the `Milestones` table includes:
* `id` which is a `Primary Key`,`unique` number assigned to each row of data.
* `milestones_name` is type of `varchar`,which is a column defined as enum,values such as "exercise 3 times a week","exercise 5 times a week".
#### Members_milestones:
the `Member_milestones` table includes:
* `id` which is a `Primary Key`,`unique` number assigned to each row of data.
* `members_id` is `FOREIGN KEY` which refers to the `PRIMARY KEY` in `Members` table.
* `milestones_id` is `FOREIGN KEY` which refers to the `PRIMARY KEY` in `Milestones` table.In order to make members to know how frequently they do exercise.
* `date` is type of `timestamptz`.It's a column to record which date has the member done.
#### Exercise_levels:
the `Exercise_levels` table includes:
* `id` which is a `Primary Key`,`unique` number assigned to each row of data.
* `level` is type of `varchar`,which represent the different type of exercise intensity.It's defined as enum,values like "easy","mid" and "hard".
#### Exercise_videos:
the `Exercise_videos` table includes:
* `id` which is a `Primary Key`,`unique` number assigned to each row of data.
* `url` which is `text` to store the video url.
* `level_id` is `FOREIGN KEY` which refers to the `PRIMARY KEY` in `Exercise_levels` table.
#### Favorites:
the `Favorites` table includes:
* `id` which is a `Primary Key`,`unique` number assigned to each row of data.
* `members_id` is `FOREIGN KEY` which refers to the `PRIMARY KEY` in `Members` table.It's record which member has done.
* `videos_id` is `FOREIGN KEY` which refers to the `PRIMARY KEY` in `Exercise_videos` table.
* `watch_status` is type of `boolean` to record the member have watched it or not.It's associate with view `member_history`.
* `date` is type of `timestamptz`.It's a column to record which date has the member done.

### Relationships

The entity relationship diagram and the relationships between the entities in my database will show as a image which is cs50-sql-finalproject-fitness-diagram-2024-12-02-151814.png.
    ![ER Diagram](diagram.png)

很多個會員可以在不同地方同時看一部影片，但一個會員一次只能看一部影片(many to one relationship)
一個會員可以有很多個我的最愛 (one to many relationship)
有很多不同的影片，但一部影片只會有一個運動難度 (many to one relationship)
OR 一部影片只會有一個運動難度，但一個運動難度可以包含很多部影片 (one to many relationship)
一個會員可以有很多個不同的里程碑 (one to many relationship)

Descriptions:
* There can be many members watch one exercise video at the same time in different places,but one member can watch one exercise video at a time.(Many to one relationship)
* A member can have many Favorites.(One to many relationship)
* One exercise video only have one exercise level,but one exercise level have many exercise videos.(One to many relationship)
* There can be many milestones for one member.(Many to one relationship)

* There can be more than one store in a city, but the same store cannot be in many cities.(one-to-many relationship)
*  There can be more than one employee in a store, but an employee cannot work in more than one store at the same time.(one-to-many relationship)
*  Multiple orders can be placed from one store, but two stores cannot be included in the same order.(one-to-many relationship)
*  There can be more than one employee in a department, but the same employee cannot be in two departments.(one-to-many relationship)
  There may be more than one employee in a job position, but the same employee cannot be in two job positions.(one-to-many relationship)
  The employee has a compensation, the same compensation represents the one employee. (One to one relationship)
  An employee can take leave at different times, but the same leave cannot represent more than one employee.(one-to-many relationship)
  A customer can place more than one order, but the same order cannot represent two customers.(one-to-many relationship)
  An employee can create multiple orders but one order cannot represent two employees.(one-to-many relationship)
  There can be multiple items in one order, but the items cannot represent two identical orders.(one-to-many relationship)
  A product can be in more than one order product table, but the order product id represents the same product only once. (one-to-many relationship)
  There can be multiple items in one order and one item can be in multiple orders.(many-to-many relationship)
  There can be more than one product in a category, but a product cannot be in 2 categories.(one-to-many relationship)
  A product has one brand, but the same brand may have multiple products.(one-to-many relationship)

## Optimizations

View:
`member_history` to record what a member had done before.
Index:
`account`,`email` on table `Members`,`title` on table `Exercise_videos` and `milestones_name` on table `Milestones`.
Because some columns are unique,text or pk,it will be more effective than no index when execute SQL.

## Limitations

Can't customize a training project.
Can't get precise data through "watch" exercise videos.The database can't get the condition of user.Such as it can't calculate how many calories a user burn.
