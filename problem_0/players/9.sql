-- to find the players who played their final game in the MLB in 2022. Sort the results alphabetically by first name, then by last name.
select first_name,last_name from players
where final_game like "2022-%"
order by first_name asc,last_name asc;
