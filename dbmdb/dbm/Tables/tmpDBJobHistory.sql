CREATE TABLE [dbm].[tmpDBJobHistory] (
    [instance_id]         INT              NOT NULL,
    [job_id]              UNIQUEIDENTIFIER NOT NULL,
    [step_id]             INT              NOT NULL,
    [step_name]           [sysname]        NOT NULL,
    [sql_message_id]      INT              NOT NULL,
    [sql_severity]        INT              NOT NULL,
    [message]             NVARCHAR (4000)  NULL,
    [run_status]          INT              NOT NULL,
    [run_date]            INT              NOT NULL,
    [run_time]            INT              NOT NULL,
    [run_duration]        INT              NOT NULL,
    [operator_id_emailed] INT              NOT NULL,
    [operator_id_netsent] INT              NOT NULL,
    [operator_id_paged]   INT              NOT NULL,
    [retries_attempted]   INT              NOT NULL,
    [server]              [sysname]        NOT NULL
);

