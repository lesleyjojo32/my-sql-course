with cte AS(

SELECT
	ps.PatientId
	,ps.Tariff
	,ps.Ward
	,SUM(ps.Tariff) OVER () AS TotalTariff
	,SUM(ps.Tariff) OVER (PARTITION BY ps.Ward) AS WardTariff
,100.0 * ps.Tariff / SUM(ps.Tariff) OVER () AS PctOfAllTariff
,100.0 * ps.Tariff / SUM(ps.Tariff) OVER (PARTITION BY ps.Ward) AS PctOfWardTariff
FROM
	PatientStay ps
)
select 

cte.PatientId
,cte.Tariff
,cte.Ward
,cte.TotalTariff
,cte.WardTariff
,ROUND(cte.PctOfAllTariff,2) AS PctOfAllTariff
,ROUND(cte.PctOfWardTariff,2) AS PctOfWardTariff

from cte
ORDER BY
	cte.Ward
	,cte.PatientId;