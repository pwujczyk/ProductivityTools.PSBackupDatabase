<#
	My Function
#>

function Backup-Databases() {
	param ([string[]]$dbNames,[string]$instanceName,[string]$destinationPath)
	
	Backup-DbaDatabase -SqlInstance $instanceName -Database $dbNames -BackupDirectory $destinationPath
}

function Backup-AllUserDatabases {
	param ([string]$InstanceName,[string]$DestinationPath)

	$dbs=Get-DbaDatabase -SqlInstance $instanceName -ExcludeAllSystemDb |select -ExpandProperty Name
	Backup-Databases $dbs $InstanceName $DestinationPath
}

function RestoreDatabase{
	param ([string]$dbPaths,[string]$destinationDirectory,[string]$InstanceName,
	[switch]$ToDateDirectory, [string]$DateNamePrefix, [string]$DateNameSuffix,
	[switch]$ToPersonalOneDrive, [switch]$ToBusinessOneDrive)

	Restore-DbaDatabase -Path $dbPaths -DestinationDataDirectory $destinationDirectory -DestinationLogDirectory $destinationDirectory -SqlInstance $sqlInstance 
}

function Restore-Database{
	param ([string]$SourceDatabasePaths,[string]$DestinationDirectory,[string]$InstanceName)

	Restore-DbaDatabase -Path $SourceDatabasePaths -DestinationDataDirectory $DestinationDirectory -DestinationLogDirectory $DestinationDirectory -SqlInstance $InstanceName 
}

Export-ModuleMember Backup-AllUserDatabases
Export-ModuleMember Restore-Database