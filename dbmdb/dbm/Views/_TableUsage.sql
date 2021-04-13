CREATE VIEW [dbm].[_TableUsage] AS
	SELECT 
	MIN([TU].[InstanceId]) OVER (PARTITION BY [TU].[InstanceId],[TU].[DBName] ORDER BY [TU].[InstanceId],[TU].[DBName],[TU].[SizeMB] DESC) AS [InstanceId],
	[TU].[DBName],
	[TU].[TableName],
	[TU].[Rows],
	[TU].[UsedMB],
	[TU].[UnusedMB],
	[TU].[SizeMB],
	[TU].[DataImportUTC]
FROM (
	SELECT 
		[InstanceId],
		[DBName],
		[TableName],
		[Rows],
		[UsedMB],
		[UnusedMB],
		[SizeMB],
		[DataImportUTC],
		ROW_NUMBER() OVER (PARTITION BY [InstanceId],[DBName],[TableName] ORDER BY [InstanceId],[DBName],[TableName],[DataImportUTC] DESC) AS [RN]
	FROM [dbm].[TableUsage]) [TU] WHERE [TU].[RN]=1
