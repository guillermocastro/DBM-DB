CREATE TABLE [dbm].[Configuration] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [InstanceId]    NVARCHAR (128) NOT NULL,
    [name]          NVARCHAR (128) NOT NULL,
    [value]         NVARCHAR (128) NOT NULL,
    [minimum]       NVARCHAR (128) NOT NULL,
    [maximum]       NVARCHAR (128) NOT NULL,
    [value_in_use]  NVARCHAR (128) NOT NULL,
    [description]   NVARCHAR (255) NOT NULL,
    [is_dynamic]    BIT            NOT NULL,
    [is_advanced]   BIT            NOT NULL,
    [DataImportUTC] DATETIME       DEFAULT (getutcdate()) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK.Configuration.Instanceid] FOREIGN KEY ([InstanceId]) REFERENCES [dbm].[Instance] ([InstanceId]) ON DELETE CASCADE ON UPDATE CASCADE
);

