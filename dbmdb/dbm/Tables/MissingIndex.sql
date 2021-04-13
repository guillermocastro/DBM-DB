CREATE TABLE [dbm].[MissingIndex]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY CLUSTERED ([Id]),
	[InstanceId] NVARCHAR (128) NOT NULL REFERENCES [dbm].[Instance] ([InstanceId]),
	[DB] NVARCHAR(128) NOT NULL,
	[Impact] DECIMAL(20,2) NOT NULL,
	[Last_User_Seek] DATETIME NOT NULL,
	[DBTable] NVARCHAR(128) NOT NULL,
	[Create_Statement] NVARCHAR(MAX) NULL,
	[DataImportUTC] DATETIME NULL,

)
/*
SELECT 
	'['+databases.[name]+']' AS [DBName],
	dm_migs.avg_user_impact*(dm_migs.user_seeks+dm_migs.user_scans) Avg_Estimated_Impact,
	dm_migs.last_user_seek AS Last_User_Seek,
	REPLACE(dm_mid.[statement],'['+databases.[name]+'].','') AS [DBTable],
	--'['+OBJECT_NAME(dm_mid.OBJECT_ID,dm_mid.database_id)+']' AS [DBTable],
	'CREATE INDEX [IX_' + OBJECT_NAME(dm_mid.OBJECT_ID,dm_mid.database_id) + '_'
	+ REPLACE(REPLACE(REPLACE(ISNULL(dm_mid.equality_columns,''),', ','_'),'[',''),']','') 
	+ CASE
	WHEN dm_mid.equality_columns IS NOT NULL
	AND dm_mid.inequality_columns IS NOT NULL THEN '_'
	ELSE ''
	END
	+ REPLACE(REPLACE(REPLACE(ISNULL(dm_mid.inequality_columns,''),', ','_'),'[',''),']','')
	+ ']'
	+ ' ON ' + dm_mid.statement
	+ ' (' + ISNULL (dm_mid.equality_columns,'')
	+ CASE WHEN dm_mid.equality_columns IS NOT NULL AND dm_mid.inequality_columns 
	IS NOT NULL THEN ',' ELSE
	'' END
	+ ISNULL (dm_mid.inequality_columns, '')
	+ ')'
	+ ISNULL (' INCLUDE (' + dm_mid.included_columns + ')', '') AS Create_Statement
FROM sys.dm_db_missing_index_groups dm_mig
	INNER JOIN sys.dm_db_missing_index_group_stats dm_migs
	ON dm_migs.group_handle = dm_mig.index_group_handle
	INNER JOIN sys.dm_db_missing_index_details dm_mid
	ON dm_mig.index_handle = dm_mid.index_handle
	INNER JOIN sys.databases 
	ON dm_mid.database_id=sys.databases.database_id
WHERE dm_mid.database_ID = DB_ID()
ORDER BY Avg_Estimated_Impact DESC

*/