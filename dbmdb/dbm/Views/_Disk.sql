CREATE VIEW [dbm].[_Disk] WITH SCHEMABINDING AS
	SELECT 
		[D].[DeviceId],
		[D].[Drive],
		CASE [D].[DriveType] 
			WHEN '2' THEN 'Removable disk'
			WHEN '3' THEN 'Fixed local disk'
			WHEN '4' THEN 'Network disk'
			WHEN '5' THEN 'Compact disk'
		ELSE 'Unknown '+[D].[DriveType] END AS [DriveType],
		[D].[MinSpace],
		[D].[FreeSpace],
		[D].[ThresholdSpace],
		[D].[UsedSpace],
		[D].[Size],
		CASE WHEN [D].[Size]=0 THEN '0' ELSE CONVERT(DECIMAL(38,2),[D].[FreeSpace]/[D].[Size]*100.) END AS [FreeSpace%],
		[D].[VolumeName],
		[D].[DataImportUTC] 
	FROM
		(SELECT 
			[DeviceId],
			[Drive],
			[DriveType],
			CONVERT(DECIMAL(38,2),0) AS [MinSpace],
			CONVERT(DECIMAL(38,2),CONVERT(DECIMAL(38,2),'0'+[Size])/1024./1024.*0.9) AS [ThresholdSpace],
			CONVERT(DECIMAL(38,2),CONVERT(DECIMAL(38,2),'0'+[FreeSpace])/1024./1024.) AS [FreeSpace],
			CONVERT(DECIMAL(38,2),CONVERT(DECIMAL(38,2),'0'+[Size])/1024./1024.-CONVERT(DECIMAL(38,2),'0'+[FreeSpace])/1024./1024.) AS [UsedSpace],
			CONVERT(DECIMAL(38,2),CONVERT(DECIMAL(38,2),'0'+[Size])/1024./1024.) AS [Size],
			[VolumeName],
			[DataImportUTC],
			ROW_NUMBER() OVER (PARTITION BY [DeviceId],[Drive] ORDER BY [DeviceId],[Drive],[DataImportUTC] DESC) AS [RN] 
		FROM [dbm].[Disk]) [D] WHERE [D].[RN]=1 AND [D].[Size]>0