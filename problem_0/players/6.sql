-- return the first name, last name, and debut date of players born in Pittsburgh, Pennsylvania (PA).
-- Sort the results first by debut date—from most recent to oldest—then alphabetically by first name, followed by last name.
select first_name,last_name,debut from players
where birth_city = "Pittsburgh" and birth_state = "PA"
order by debut desc,first_name,last_name;
