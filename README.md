# CS50 SQL
參加哈佛SQL線上課程，此專案以final project(自行設計一個資料庫及所需要的table、Index、View、CRUD等)為主，我的final project是Fitness Database

## Final Project
* 在對應資料夾內打上:sqlite3 fitness.db 建立fitness.db
* .read file_name 依照file內容建立tables。例如.read schema.sql
* .tables 顯示資料庫內的資料表有哪些

### Table
* Members: 會員資料 (id,account,email,birth,height,weight)
* Exercise_videos: 運動影片 (id,title,url,level_id)，與Exercise_levels的ID 關聯
* Exercise_levels: 運動影片之難度(id,level)
* Milestones: 里程碑 (id,milestones_name,frequency)
* Members_milestones: 會員里程碑，運動達到特定次數後便會將資料insert到此資料表(id,members_id,milestones_id,date)。與Members的ID和Milestones的ID 關聯
* Favorites: 類似我的最愛，把影片加到我的最愛 (id,members_id,videos_id,watch_status,date)，與Members的ID和Exercise_videos的ID關聯

### View
* member_history: 歷史紀錄，從Favorites觀看影片後，會將該影片的watch_status更新成true、date則會更新成現在的時間

### Index
#### table Members
* account
* email
####  table Exercise_videos
* title
#### table Milestones
* milestones_name

### Diagram
![ER Diagram](final_project/fitness-diagram.png)

### 相關連結
[HarvardX: CS50's Introduction to Databases with SQL](<https://www.edx.org/learn/sql/harvard-university-cs50-s-introduction-to-databases-with-sql?correlationId=b31fb4f2-1521-4ba2-ad58-f0f8387a24567a2456>)