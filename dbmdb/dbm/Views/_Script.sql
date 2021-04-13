CREATE VIEW [dbm].[_Script]
	AS
SELECT 
	t.[ScriptName]
	,t.[Database]
	,t.[Requirements]
	,t.[TSql]
	,t.[DataImportUTC]
	,t.[Version]
FROM (
SELECT 
	s.[ScriptName]
	,ISNULL(s.[Database],'master') AS [Database]
	,s.[Requirements]
	,s.[TSql]
	,s.[DataImportUTC]
	,s.[Version] 
	,ROW_NUMBER() OVER (PARTITION BY s.[ScriptName] ORDER BY s.[ScriptName],s.[DataImportUTC] DESC) AS [RN]
FROM [dbm].[Script] s) t

