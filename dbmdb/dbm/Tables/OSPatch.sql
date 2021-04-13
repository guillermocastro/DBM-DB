CREATE TABLE [dbm].[OSPatch] (
    [Id]                 INT            IDENTITY (1, 1) NOT NULL,
    [OS]                 NVARCHAR (128) NOT NULL,
    [Version]            NVARCHAR (64)  NOT NULL,
    [ServicingOption]    NVARCHAR (128) NOT NULL,
    [AvailabilityDate]   DATE           NOT NULL,
    [OSBuild]            NVARCHAR (64)  NOT NULL,
    [LatestRevisionDate] DATE           NOT NULL,
    [EndOfService1]      DATE           NULL,
    [EndOfService2]      DATE           NULL,
    [CE]                 NVARCHAR (20)  DEFAULT ('Compliant') NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80)
);

