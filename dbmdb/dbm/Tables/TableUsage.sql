﻿CREATE TABLE [dbm].[TableUsage]
(
	[Id] INT NOT NULL IDENTITY(1,1),
	CONSTRAINT [PK.TableUsage.Id] PRIMARY KEY CLUSTERED ([Id]),
	[InstanceId] NVARCHAR(128) NOT NULL,
	CONSTRAINT [FK.TableUsage.InstanceId] FOREIGN KEY ([InstanceId]) REFERENCES [dbm].[Instance] ([InstanceId]) ON DELETE CASCADE ON UPDATE CASCADE,
	[DBName] NVARCHAR(128) NOT NULL,
	[TableName] NVARCHAR(128) NOT NULL,
	[Rows] BIGINT NOT NULL,
	[UsedMB] DECIMAL (38,0) NOT NULL,
	[UnusedMB] DECIMAL (38,0) NOT NULL,
	[SizeMB] DECIMAL (38,0) NOT NULL,
	[DataImportUTC] DATETIME NULL DEFAULT GETUTCDATE(),
)