CREATE TABLE [dbm].[Product] (
    [ProductId]    NVARCHAR (128) NOT NULL,
    [ProductName]  NVARCHAR (128) NULL,
    [ProductAlias] NVARCHAR (32)  NULL,
    [Manufacturer] NVARCHAR (128) NULL,
    [Version]      NVARCHAR (64)  NULL,
    [ReleaseDate]  DATETIME       NULL,
    [KBNumber]     NVARCHAR (16)  NULL,
    [IsCompliant]  BIT            NULL,
    PRIMARY KEY CLUSTERED ([ProductId] ASC) WITH (FILLFACTOR = 80)
);

