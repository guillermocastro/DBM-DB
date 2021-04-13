CREATE VIEW [dbm].[_SQLCompliance]
	AS 
SELECT 
	I.InstanceId
	,ISNULL(I.[ProductVersion],'12.0.5659.1') AS [ProductVersion]
	,ISNULL(SS.SqlServerId,'SQL Server 2014') AS SqlServerId
	,I.Edition AS [Licensing]
	,ISNULL(SP.PatchStatus,'Outdated') AS [PatchStatus]
	,I.[Level]+' '+I.ProductUpdateLevel AS CurrentLevel
	FROM dbm.Instance I
LEFT JOIN [dbm].[SQLPatch] SP ON I.ProductVersion=SP.[SQLPatch]
LEFT JOIN [dbm].[SQLServer] SS ON SUBSTRING(I.ProductVersion,1,LEN(SS.SQLServerVersion))=SS.SQLServerVersion