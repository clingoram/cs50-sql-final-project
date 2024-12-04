-- to determine how many points of latitude we have at least one data point for. (Why might we not have data points for all latitudes?)
select
    count(distinct latitude)
from normals;
