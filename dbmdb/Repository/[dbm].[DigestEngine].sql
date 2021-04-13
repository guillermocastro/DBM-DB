USE [DBMDB]
GO

/****** Object:  StoredProcedure [dbm].[DigestEngine]    Script Date: 09/10/2020 15:20:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROC [dbm].[DigestEngine] @xmlstr NVARCHAR(MAX) AS
BEGIN
	DECLARE @xml XML=CONVERT(XML,@xmlstr)
	DECLARE @hDoc INT
	DECLARE @Source TABLE (
		[InstanceId] NVARCHAR(128) NULL,
		[DeviceId] NVARCHAR(128) NULL,
		[Importance] CHAR(1) NULL DEFAULT '2',
		[Version] NVARCHAR(300) NULL,
		[Edition] NVARCHAR(128) NULL,
		[Level] NVARCHAR(128) NULL,
		[ProductUpdateLevel] NVARCHAR(128) NULL,
		[ProductUpdateReference] NVARCHAR(128) NULL,
		[ResourceLastUpdateDateTime] NVARCHAR(128) NULL,
		[ProductVersion] NVARCHAR(128) NULL,
		[DBEAccount] NVARCHAR(256) NULL,
		[AgentAccount] NVARCHAR(256) NULL,
		[InstanceDefaultDataPath] NVARCHAR(128) NULL,
		[InstanceDefaultLogPath] NVARCHAR(128) NULL,
		[BackupDirectory] NVARCHAR(256) NULL,
		[ServerState] VARCHAR(6) NULL,
		[IsSingleUser] NVARCHAR(128) NULL,
		[Collation] NVARCHAR(128) NULL,
		[Host] NVARCHAR(255) NULL,
		[MonitorDisk] BIT NULL DEFAULT 'FALSE',
		[MonitorRAM] BIT NULL DEFAULT 'FALSE',
		[MonitorCPU] BIT NULL DEFAULT 'FALSE',
		[RemoteBackup] BIT NULL DEFAULT 'FALSE',
		[IsDbcInstalled] BIT NULL DEFAULT 'FALSE',
		[DataImportUTC] DATETIME NULL DEFAULT GETUTCDATE()
	)
	EXEC sp_xml_preparedocument @hDoc OUTPUT, @xml
		INSERT INTO @Source ([DeviceId],[InstanceId],[Version],[Edition],[Level],[ProductUpdateLevel],[ProductUpdateReference],[ResourceLastUpdateDateTime]
		,[ProductVersion],[DBEAccount],[AgentAccount],[InstanceDefaultDataPath],[InstanceDefaultLogPath],[BackupDirectory],[ServerState],[IsSingleUser],[Collation],[DataImportUTC])
		SELECT [DeviceId],[InstanceId],[Version],[Edition],[Level],[ProductUpdateLevel],[ProductUpdateReference],[ResourceLastUpdateDateTime]
		,[ProductVersion],[DBEAccount],[AgentAccount],[InstanceDefaultDataPath],[InstanceDefaultLogPath],[BackupDirectory],[ServerState],[IsSingleUser],[Collation],GETUTCDATE() AS [DataImportUTC]
		 FROM OPENXML(@hdoc,'/Servers')
		WITH (
			[DeviceId] [VARCHAR] (128) 'Machine/@MachineId',
			[InstanceId] [VARCHAR] (128) 'Machine/DBE/@DBEId',
			[Version] [VARCHAR] (128) 'Machine/DBE/@Version',
			[Edition] [VARCHAR] (128) 'Machine/DBE/@Product',
			[Level] [VARCHAR] (128) 'Machine/DBE/@Level',
			[ProductUpdateLevel] [VARCHAR] (128) 'Machine/DBE/@UpdateLevel',
			[ProductUpdateReference] [VARCHAR] (128) 'Machine/DBE/@ProductUpdateReference',
			[ResourceLastUpdateDateTime] [DATETIME] 'Machine/DBE/@ResourceLastUpdateDateTime',
			[ProductVersion] [VARCHAR] (128) 'Machine/DBE/@ProductVersion',
			[DBEAccount] [VARCHAR] (128) 'Machine/DBE/@DBEAccount',
			[AgentAccount] [VARCHAR] (128) 'Machine/DBE/@AgentAccount',
			[InstanceDefaultDataPath] [VARCHAR] (128) 'Machine/DBE/@DataPath',
			[InstanceDefaultLogPath] [VARCHAR] (128) 'Machine/DBE/@LogPath',
			[BackupDirectory] [VARCHAR] (128) 'Machine/DBE/@BackupPath',
			[ServerState] [VARCHAR] (128) 'Machine/DBE/@ServerState',
			[IsSingleUser] [VARCHAR] (128) 'Machine/DBE/@IsSingleUser',
			[Collation] [VARCHAR] (128) 'Machine/DBE/@Collation',
			[DataImportUTC] [DATETIME] 'Machine/DBE/@DataImportUTC'
		)
		EXEC sp_xml_removedocument @hDoc
		MERGE [dbm].[Instance] T
		USING @Source S
		ON T.[InstanceId]=S.[InstanceId]
		WHEN MATCHED THEN
			UPDATE SET T.[DeviceId]=S.[DeviceId],T.[Version]=S.[Version],T.[Edition]=S.[Edition],T.[Level]=S.[Level],T.[ProductUpdateLevel]=S.[ProductUpdateLevel]
			,T.[ProductUpdateReference]=S.[ProductUpdateReference],T.[ResourceLastUpdateDateTime]=S.[ResourceLastUpdateDateTime],T.[ProductVersion]=S.[ProductVersion]
			,T.[DBEAccount]=S.[DBEAccount],T.[AgentAccount]=S.[AgentAccount],T.[InstanceDefaultDataPath]=S.[InstanceDefaultDataPath]
			,T.[InstanceDefaultLogPath]=S.[InstanceDefaultLogPath],T.[BackupDirectory]=S.[BackupDirectory],T.[ServerState]=S.[ServerState]
			,T.[IsSingleUser]=S.[IsSingleUser],T.[Collation]=S.[Collation],T.[DataImportUTC]=S.[DataImportUTC]
		WHEN NOT MATCHED BY TARGET THEN
			INSERT ([DeviceId],[InstanceId],[Version],[Edition],[Level],[ProductUpdateLevel],[ProductUpdateReference],[ResourceLastUpdateDateTime]
		,[ProductVersion],[DBEAccount],[AgentAccount],[InstanceDefaultDataPath],[InstanceDefaultLogPath],[BackupDirectory],[ServerState],[IsSingleUser],[Collation],[DataImportUTC]) VALUES
		(S.[DeviceId],S.[InstanceId],S.[Version],S.[Edition],S.[Level],S.[ProductUpdateLevel],S.[ProductUpdateReference],S.[ResourceLastUpdateDateTime]
		,S.[ProductVersion],S.[DBEAccount],S.[AgentAccount],S.[InstanceDefaultDataPath],S.[InstanceDefaultLogPath],S.[BackupDirectory],S.[ServerState],S.[IsSingleUser],S.[Collation],S.[DataImportUTC])
		;
END
GO


