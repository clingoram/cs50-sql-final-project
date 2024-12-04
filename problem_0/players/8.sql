-- Find the average height and weight, rounded to two decimal places, of baseball players who debuted on or after January 1st, 2000.
-- Return the columns with the name “Average Height” and “Average Weight”, respectively.
select
    round(avg(height),2) as "Average Height",
    round(avg(weight),2) as "Average Weight"
from players
where debut >= "2000-01-01";
