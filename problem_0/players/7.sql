-- count the number of players who bat (or batted) right-handed and throw (or threw) left-handed, or vice versa.
select count(first_name) from players
where (bats = "R" and throws = "L")
or (bats = "L" and throws = "R");
