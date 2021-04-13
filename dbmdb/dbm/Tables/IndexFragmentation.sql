CREATE TABLE [dbm].[IndexFragmentation]
(
    [Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY CLUSTERED ([Id]),
    [InstanceId]    NVARCHAR (128)  NOT NULL,
    [DB]        NVARCHAR (128)  NOT NULL,
    [DBTable]         NVARCHAR (128)  NOT NULL,
    [DBIndex]         NVARCHAR (128)  NOT NULL,
    [Fragmentation] DECIMAL(10,2)   NULL,
    [page_count]    INT NULL,
    [DataImportUTC] DATETIME NULL,
)
/*
SELECT '['+S.[name]+'].['+T.[name]+']' as 'Table',
'['+I.[name]+']' as 'Index',
CONVERT(DECIMAL(10,2),DDIPS.avg_fragmentation_in_percent) AS [Fragmentation],
DDIPS.page_count
FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, NULL) AS DDIPS
INNER JOIN sys.tables T on T.object_id = DDIPS.object_id
INNER JOIN sys.schemas S on T.schema_id = S.schema_id
INNER JOIN sys.indexes I ON I.object_id = DDIPS.object_id
AND DDIPS.index_id = I.index_id
WHERE DDIPS.database_id = DB_ID()
and I.name is not null
AND DDIPS.avg_fragmentation_in_percent > 0
ORDER BY DDIPS.avg_fragmentation_in_percent DESC

*/