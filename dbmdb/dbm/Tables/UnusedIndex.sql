CREATE TABLE [dbm].[UnusedIndex]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY CLUSTERED ([Id]),
    [InstanceId] NVARCHAR (128) NOT NULL REFERENCES [dbm].[Instance] ([InstanceId]),
    [DB] NVARCHAR(128) NOT NULL,
	[DBTable] NVARCHAR(128) NOT NULL,
	[DBIndex] NVARCHAR(128) NOT NULL,
	[user_seeks] INT NULL,
	[user_scans] INT NULL,
	[user_updates] INT NULL,
	[DataImportUTC] DATETIME NULL,
)
/*
SELECT
	'['+S.[name]+'].['+O.[name]+']' AS DBTable,
    '['+I.[name]+']' AS DBIndex,
    UI.user_seeks,
    UI.user_scans,
    UI.user_updates
FROM
    sys.dm_db_index_usage_stats UI
    INNER JOIN sys.objects O ON UI.OBJECT_ID = O.OBJECT_ID
	INNER JOIN sys.schemas S ON S.schema_id=O.[schema_id]
    INNER JOIN sys.indexes I ON I.index_id = UI.index_id AND UI.OBJECT_ID = I.OBJECT_ID
WHERE
    UI.user_lookups = 0
    AND
    UI.user_seeks = 0
    AND
    UI.user_scans = 0
ORDER BY
    UI.user_updates DESC
*/