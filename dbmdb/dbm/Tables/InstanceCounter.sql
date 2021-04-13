CREATE TABLE [dbm].[InstanceCounter]
(
	[Id] INT NOT NULL IDENTITY(1,1),
	CONSTRAINT [PK.InstanceCounter.Id] PRIMARY KEY CLUSTERED ([Id]),
	[InstanceId] NVARCHAR(128) NOT NULL,
	CONSTRAINT [FK.InstanceCounter.InstanceId] FOREIGN KEY ([InstanceId]) REFERENCES [dbm].[Instance] ([InstanceId]) ON DELETE CASCADE ON UPDATE CASCADE,
	[CounterName] NVARCHAR(125) NOT NULL,
	[MinThreshold] NVARCHAR(32) NULL,
	[MaxThreshold] NVARCHAR(32) NULL,
)
