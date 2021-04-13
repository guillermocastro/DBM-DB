CREATE TABLE [dbm].[SQLServer] (
    [SQLServerVersion] NVARCHAR (4)  NOT NULL,
    [SqlServerId]      NVARCHAR (64) NOT NULL,
    PRIMARY KEY CLUSTERED ([SqlServerId] ASC) WITH (FILLFACTOR = 80)
);

