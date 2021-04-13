CREATE TABLE [dbm].[tmpDB] (
    [InstanceId]      NVARCHAR (128) NOT NULL,
    [DBName]          NVARCHAR (128) NOT NULL,
    [IsUserDB]        BIT            NULL,
    [DBState]         NVARCHAR (20)  NULL,
    [DBUserAccess]    NVARCHAR (20)  NULL,
    [DBRecovery]      NVARCHAR (20)  NULL,
    [DBCollation]     NVARCHAR (128) NULL,
    [DBCompatibility] INT            NULL,
    [DBCreation]      DATETIME       NULL,
    CONSTRAINT [FK.tmpDB.InstanceId] FOREIGN KEY ([InstanceId]) REFERENCES [dbm].[Instance] ([InstanceId]) ON DELETE CASCADE ON UPDATE CASCADE
);

