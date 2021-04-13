CREATE TABLE [dbm].[DB] (
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [InstanceId]      NVARCHAR (128) NOT NULL,
    [DBName]          NVARCHAR (128) NOT NULL,
    [IsUserDB]        BIT            NULL,
    [DBState]         NVARCHAR (20)  NULL,
    [DBUserAccess]    NVARCHAR (20)  NULL,
    [DBRecovery]      NVARCHAR (20)  NULL,
    [DBCollation]     NVARCHAR (128) NULL,
    [DBCompatibility] INT            NULL,
    [DBCreation]      DATETIME       NULL,
    [DBUse]           NVARCHAR (10)  NULL,
    [PersonalData]    BIT            NULL,
    [IsReplica]       BIT            NULL,
    [LastDBCheck]     DATETIME       NULL,
    [LastReIndex]     DATETIME       NULL,
    [LastShrink]      DATETIME       NULL,
    [DataImportUTC]   DATETIME       DEFAULT (getutcdate()) NULL,
    CONSTRAINT [PK.DB.Id] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK.DB.InstanceId] FOREIGN KEY ([InstanceId]) REFERENCES [dbm].[Instance] ([InstanceId]) ON DELETE CASCADE ON UPDATE CASCADE
);

