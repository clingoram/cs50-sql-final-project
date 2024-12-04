-- To answer a question of your choice. This query should:
--  Make use of AS to rename a column
--  Involve at least condition, using WHERE
--  Sort by at least one column using ORDER BY
select first_name as name from players
where bats = "R"
order by last_name asc;
