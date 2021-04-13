CREATE TABLE [dbm].[DBRestore] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [RestoreId]     INT            NOT NULL,
    [InstanceId]    NVARCHAR (128)  NOT NULL,
    [RestoreDate]   DATETIME       NULL,
    [DBName]        NVARCHAR (128) NULL,
    [UserName]      NVARCHAR (128) NULL,
    [BackupSetId]   INT            NULL,
    [RestoreTypeId] NVARCHAR (20)  NULL,
    [Replace]       BIT            NULL,
    [Recovery]      BIT            NULL,
    [DataImportUTC] DATETIME       DEFAULT (getutcdate()) NULL,
    CONSTRAINT [PK.DBRestore.Id] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK.DBRestore.InstanceId] FOREIGN KEY ([InstanceId]) REFERENCES [dbm].[Instance] ([InstanceId]) ON DELETE CASCADE ON UPDATE CASCADE
);

