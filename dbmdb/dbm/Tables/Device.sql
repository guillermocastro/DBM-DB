CREATE TABLE [dbm].[Device] (
    [DeviceId]      NVARCHAR (24)  NOT NULL,
    [OS]            NVARCHAR (128) NULL,
    [Manufacturer]  NVARCHAR(128)  NULL,
    [Model]         NVARCHAR(128)  NULL,
    [Category]      NVARCHAR(32)   NULL,
    [Version]       NVARCHAR (64)  NULL,
    [OSBuild]       NVARCHAR (64)  NULL,
    [SerialNo]      NVARCHAR (64)  NULL,
    [RAM]           NVARCHAR (64)  NULL,
    [CPU]           NVARCHAR (128) NULL,
    [Cores]         INT            NULL,
    [MAC]           NVARCHAR(20)   NULL,
    [IPAddress]     NVARCHAR(32)   NULL,
    [SiteName]      NVARCHAR(64)   NULL,
    [Location]      NVARCHAR(64)   NULL,
    [Antivirus]     NVARCHAR(32)   NULL,
    [Department]    NVARCHAR (128) NULL,
    [InAD]          BIT            NULL,
    [WoL]           BIT            NULL,
    [SerialNumber]  NVARCHAR(64)   NULL,
    [LastDetection] DATETIME       NULL,
    [Description]   NVARCHAR(MAX)  NULL,
    [Attributes]    NVARCHAR(MAX)  NULL,
    [PlatformId]    NVARCHAR(20)   NULL,
    [DataImportUTC] DATETIME       DEFAULT (getutcdate()) NULL,
    PRIMARY KEY CLUSTERED ([DeviceId] ASC) WITH (FILLFACTOR = 80)
);

