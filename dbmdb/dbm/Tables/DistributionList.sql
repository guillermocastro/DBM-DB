CREATE TABLE [dbm].[DistributionList] (
    [ProcessId] NVARCHAR (20)  NOT NULL,
    [EventId]   NVARCHAR (20)  NOT NULL,
    [MailTo]    NVARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([ProcessId] ASC) WITH (FILLFACTOR = 80)
);

