CREATE TABLE [dbm].[Disk] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [DeviceId]      NVARCHAR (128) NOT NULL,
    [Drive]         NVARCHAR (10)  NULL,
    [DriveType]     NVARCHAR (10)  NULL,
    [FreeSpace]     NVARCHAR (38)  NULL,
    [Size]          NVARCHAR (38)  NULL,
    [VolumeName]    NVARCHAR (128) NULL,
    [DataImportUTC] DATETIME       DEFAULT (getutcdate()) NULL,
    CONSTRAINT [PK.Disk.Id] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80)
);

