-- return all normal ocean temperatures at 50m of depth, as well as their respective degrees of latitude and longitude, within the Arabian Sea.
-- Include latitude, longitude, and temperature columns.
select "50m",latitude,longitude from normals where latitude between (0) and (20) and longitude between (55) and (75);