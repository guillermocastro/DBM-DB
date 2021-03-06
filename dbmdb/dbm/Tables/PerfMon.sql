CREATE TABLE [dbm].[PerfMon]
(
	[Id] INT NOT NULL IDENTITY(1,1),
	CONSTRAINT [PK.PerfMon.Id] PRIMARY KEY CLUSTERED ([Id]),
	[InstanceId] NVARCHAR(128) NOT NULL,
	CONSTRAINT [FK.PerfMon.InstanceId] FOREIGN KEY ([InstanceId]) REFERENCES [dbm].[Instance] ([InstanceId]) ON DELETE CASCADE ON UPDATE CASCADE,
	[Counter] NVARCHAR(128) NOT NULL,
	[Value] NVARCHAR(128) NULL,
	[DataImportUTC] DATETIME NULL DEFAULT GETUTCDATE(),
)
