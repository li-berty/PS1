###############################################################################################################
# Language     :  PowerShel
# Filename     :  EmptyDir
# Autor        :  Berty Li (https://github.com/li-berty)
# Description  :  Find empty folders in Windows 10
# Version      : 
# Repository   :  https://github.com/li-berty/--ENTERNAMEHERE--
###############################################################################################################

"*WARNING* For start on a Windows disk, you must run as an administrator."
"If you scanning an all drive, it might take longer to complete. `n"

$SomePath= Read-Host 'Enter path for scaning (eg. C:\Users\)'
Get-ChildItem -Path $SomePath -Recurse -Directory | ForEach-Object -Process {
 if ($false -eq $_.GetFileSystemInfos())
  {$_.FullName}}
