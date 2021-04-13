CREATE TABLE [dbm].[Restore]
(
	[Id] INT NOT NULL IDENTITY(1,1),
	CONSTRAINT [PK.Restore.Id] PRIMARY KEY CLUSTERED ([Id]),
	[RestoreId] INT NOT NULL,
	[InstanceId] NVARCHAR(128) NOT NULL,
	CONSTRAINT [FK.Restore.InstanceId] FOREIGN KEY ([InstanceId]) REFERENCES [dbm].[Instance] ([InstanceId]) ON DELETE CASCADE ON UPDATE CASCADE,
	[RestoreDate] DATETIME NULL,
	[DBName] NVARCHAR(128) NULL,
	[UserName] NVARCHAR(128) NULL,
	[BackupSetId] INT NULL,
	[RestoreTypeId] NCHAR(1) NULL,
	[Replace] BIT NULL,
	[Recovery] BIT NULL,
)
