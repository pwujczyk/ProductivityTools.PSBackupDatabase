clear
cd $PSScriptRoot
Import-Module .\ProductivityTools.PSBackupDatabase.psm1 -Force
Backup-AllUserDatabases -InstanceName "localhost\sql2017"  -DestinationPath "d:\OneDrive\backup\"
#Restore-Database -SourceDatabasePaths "D:\trash\bb\" -DestinationDirectory "D:\Trash\bb" -InstanceName "localhost\sql2014"