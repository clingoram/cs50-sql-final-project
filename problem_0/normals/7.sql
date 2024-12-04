-- to find the average ocean surface temperature, rounded to two decimal places, along the equator. Call the resulting column “Average Equator Ocean Surface Temperature”.
select
    round(avg("0m"),2) as "Average Equator Ocean Surface Temperature"
from normals where latitude between (-0.5) and (0.5);
