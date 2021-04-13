CREATE TABLE [dbm].[tmpDBBackup] (
    [Id]                  INT             IDENTITY (1, 1) NOT NULL,
    [InstanceId]          NVARCHAR (128)  NOT NULL,
    [DBName]              NVARCHAR (128)  NULL,
    [BackupStart]         DATETIME        NULL,
    [BackupEnd]           DATETIME        NULL,
    [ExpiryDate]          DATETIME        NULL,
    [BackupType]          VARCHAR (11)    NULL,
    [IsPasswordProtected] BIT             NULL,
    [IsCompressed]        BIT             NULL,
    [IsEncrypted]         BIT             NOT NULL,
    [CompressedSizeKB]    DECIMAL (20, 2) NULL,
    [BackupSizeKB]        DECIMAL (20, 2) NULL,
    [BackupFile]          NVARCHAR (260)  NULL,
    [Description]         NVARCHAR (255)  NULL,
    [device_type]         VARCHAR (13)    NULL,
    [first_lsn]           NUMERIC (25)    NULL,
    [last_lsn]            NUMERIC (25)    NULL,
    [checkpoint_lsn]      NUMERIC (25)    NULL,
    [DataImportUTC]       DATETIME        DEFAULT (getutcdate()) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    FOREIGN KEY ([InstanceId]) REFERENCES [dbm].[Instance] ([InstanceId])
);

