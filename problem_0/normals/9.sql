-- find the 10 locations with the highest normal ocean surface temperature, sorted warmest to coldest. If two locations have the same normal ocean surface temperature,
-- sort by latitude, smallest to largest. Include latitude, longitude, and surface temperature columns.
select
    "0m",
    latitude,
    longitude
from normals
order by "0m" desc,latitude asc
limit 10;
