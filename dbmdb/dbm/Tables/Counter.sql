CREATE TABLE [dbm].[Counter]
(
	[CounterId] INT NOT NULL IDENTITY(1,1),
	CONSTRAINT [PK.Counter.CounterId] PRIMARY KEY CLUSTERED ([CounterId]),
	[CounterName] NVARCHAR(125) NOT NULL,
	[MinThreshold] NVARCHAR(32) NULL,
	[MaxThreshold] NVARCHAR(32) NULL,
)
