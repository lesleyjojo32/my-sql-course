
DROP TABLE IF EXISTS #TempPatientStay

SELECT
	ps.AdmittedDate
	,DATENAME(MONTH,ps.AdmittedDate) AS MonthAdmitted
	,ps.Tariff
INTO #TempPatientStay

FROM
	PatientStay ps
WHERE
	ps.Hospital = 'Oxleas'
	AND ps.Ward = 'Dermatology'

SELECT * from #TempPatientStay	