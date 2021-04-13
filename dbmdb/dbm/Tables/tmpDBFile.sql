CREATE TABLE [dbm].[tmpDBFile] (
    [InstanceId]   NVARCHAR (128)  NOT NULL,
    [DBName]       NVARCHAR (128)  NOT NULL,
    [FileName]     VARCHAR (128)   NOT NULL,
    [FileType]     VARCHAR (20)    NULL,
    [PhysicalDisk] VARCHAR (256)   NULL,
    [MaxSizeMB]    NUMERIC (20, 2) NULL,
    [Growth]       VARCHAR (32)    NULL,
    [FileSizeMB]   NUMERIC (20, 2) NULL,
    [FreeSpaceMB]  NUMERIC (20, 2) NULL,
    [FreeSpace%]   NUMERIC (20, 2) NULL
);

