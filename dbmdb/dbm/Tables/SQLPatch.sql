CREATE TABLE [dbm].[SQLPatch] (
    [SQLPatch]     NVARCHAR (32) NOT NULL,
    [SqlServerId]  NVARCHAR (64) NOT NULL,
    [CUN]          NVARCHAR (32) NOT NULL,
    [SQLPatchDate] DATETIME      NULL,
    [PatchStatus]  NVARCHAR (20) NULL,
    [PatchRelease] DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([SQLPatch] ASC) WITH (FILLFACTOR = 80),
    FOREIGN KEY ([SqlServerId]) REFERENCES [dbm].[SQLServer] ([SqlServerId])
);

