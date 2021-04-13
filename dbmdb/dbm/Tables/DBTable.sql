CREATE TABLE [dbm].[DBTable] (
    [Id]            BIGINT         IDENTITY (1, 1) NOT NULL,
    [InstanceId]    NVARCHAR (128) NOT NULL,
    [DBName]        NVARCHAR (128) NOT NULL,
    [name]          NVARCHAR (128) NULL,
    [rows]          VARCHAR (50)   NULL,
    [reserved]      VARCHAR (50)   NULL,
    [data]          VARCHAR (50)   NULL,
    [index_size]    VARCHAR (50)   NULL,
    [unused]        VARCHAR (50)   NULL,
    [DataImportUTC] DATETIME       DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK.DBTable.Id] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK.DBTable.Instanceid] FOREIGN KEY ([InstanceId]) REFERENCES [dbm].[Instance] ([InstanceId]) ON DELETE CASCADE ON UPDATE CASCADE
);

