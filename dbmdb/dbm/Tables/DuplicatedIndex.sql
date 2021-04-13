CREATE TABLE [dbm].[DuplicatedIndex]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY CLUSTERED ([Id]),
	[InstanceId] NVARCHAR (128) NOT NULL REFERENCES [dbm].[Instance] ([InstanceId]),
	[DB] NVARCHAR(128) NOT NULL,
	[type_desc] NVARCHAR(16) NOT NULL,
	[DBTable] NVARCHAR(128) NOT NULL,
	[Columns] NVARCHAR(MAX) NOT NULL,
	[include_columns] NVARCHAR(MAX) NOT NULL,
	[DBIndex] NVARCHAR(128) NOT NULL,
)
/*
set transaction isolation level read uncommitted

;WITH IndexColumns AS (
        SELECT DISTINCT a.object_id, a.name, 
                        a.type_desc, b.column_id, 
                        TABLE_NAME=c.name, 
                        [COL NAME]=d.name, 
                        b.is_included_column
        FROM sys.indexes a

        INNER JOIN sys.index_columns b 
                ON a.object_id = b.object_id AND a.index_id = b.index_id

        INNER JOIN sys.tables c 
                ON b.object_id = c.object_id

        INNER JOIN sys.columns d 
                ON c.object_id = d.object_id 
               AND b.column_id = d.column_id 

        WHERE is_hypothetical = 0

        ),
    CombineCols AS (

        SELECT object_id, name, type_desc, 
               table_name
              ,columns=STUFF((
                SELECT ',' + [COL NAME]
                FROM IndexColumns b
                WHERE a.object_id = b.object_id 
                  AND a.name = b.name 
                  AND a.type_desc = b.type_desc 
                  AND a.TABLE_NAME = b.TABLE_NAME 
                  AND b.is_included_column = 0
                ORDER BY [COL NAME]
                FOR XML PATH(''),TYPE).value('.', 'VARCHAR(MAX)'), 1, 1, '')
            ,include_columns=ISNULL(STUFF((
                SELECT ',' + [COL NAME]
                FROM IndexColumns b
                WHERE a.object_id = b.object_id AND 
                    a.name = b.name AND 
                    a.type_desc = b.type_desc AND
                    a.TABLE_NAME = b.TABLE_NAME AND b.is_included_column = 1
                ORDER BY [COL NAME]
                FOR XML PATH(''), TYPE).value('.', 'VARCHAR(MAX)'), 1, 1, ''), '')
        FROM IndexColumns a
        GROUP BY object_id, name, type_desc, table_name)
SELECT b.type_desc, a.table_name, a.columns, a.include_columns, b.name
FROM (
    SELECT table_name, columns, include_columns
    FROM CombineCols
    GROUP BY table_name, columns, include_columns
    HAVING COUNT(name) > 1) a
INNER JOIN CombineCols b 
    ON a.table_name = b.table_name AND
        a.columns = b.columns  AND
        a.include_columns = b.include_columns
ORDER BY a.table_name, a.columns
*/