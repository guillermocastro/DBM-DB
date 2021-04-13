CREATE VIEW [dbm].[_PerfMon]
	AS 
SELECT 
	pm2.[InstanceId]
	,pm2.[Counter]
	,pm2.[Value]
	,pm2.[DataImportUTC]
FROM (
SELECT 
	pm.[InstanceId]
	,pm.[Counter]
	,pm.[Value]
	,pm.[DataImportUTC]
	,ROW_NUMBER() OVER (PARTITION BY pm.[InstanceId],pm.[Counter] ORDER BY pm.[InstanceId],pm.[Counter],pm.[DataImportUTC] DESC) AS RN
FROM dbm.PerfMon pm) pm2 WHERE pm2.RN=1

