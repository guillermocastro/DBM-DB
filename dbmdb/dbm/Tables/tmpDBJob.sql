CREATE TABLE [dbm].[tmpDBJob] (
    [InstanceId]                 NVARCHAR (128)   NOT NULL,
    [job_id]                     UNIQUEIDENTIFIER NOT NULL,
    [originating_server_id]      INT              NOT NULL,
    [name]                       [sysname]        NOT NULL,
    [enabled]                    TINYINT          NOT NULL,
    [description]                NVARCHAR (512)   NULL,
    [start_step_id]              INT              NOT NULL,
    [category_id]                INT              NOT NULL,
    [owner_sid]                  VARBINARY (85)   NOT NULL,
    [notify_level_eventlog]      INT              NOT NULL,
    [notify_level_email]         INT              NOT NULL,
    [notify_level_netsend]       INT              NOT NULL,
    [notify_level_page]          INT              NOT NULL,
    [notify_email_operator_id]   INT              NOT NULL,
    [notify_netsend_operator_id] INT              NOT NULL,
    [notify_page_operator_id]    INT              NOT NULL,
    [delete_level]               INT              NOT NULL,
    [date_created]               DATETIME         NOT NULL,
    [date_modified]              DATETIME         NOT NULL,
    [version_number]             INT              NOT NULL,
    CONSTRAINT [FK.tmpsysjobs.Instanceid] FOREIGN KEY ([InstanceId]) REFERENCES [dbm].[Instance] ([InstanceId]) ON DELETE CASCADE ON UPDATE CASCADE
);

