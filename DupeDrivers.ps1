"Identify and remove duplicate drivers in Windows 10 `n"

param (
$Outfile = (Get-ItemProperty -Path  "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Desktop").desktop + "\dupe-drivers.txt",
$Backup = "C:\drivers-backup-$("{0:yyyy-MM-dd}" -f (Get-Date))",
#Do not include / display the latest dupe drivers used for rollback 
[switch]$HideRollback
        )

#Evaluate $HideRollback
if ($HideRollback) {$hr = 2} else {$hr = 1}

#Array for collecting duplicate drivers
$dupe = @()

#Get all OEM drivers
Get-WindowsDriver -Online |
#Select specific driver properties (will calculate Size later)
Select-Object ClassDescription, ProviderName, Driver, Version, Date, BootCritical, Size,
@{name="Name"; expression= {Split-Path -Path $_.OriginalFileName -Leaf}},
#driver directory
@{name="Cat"; expression= {Split-Path -Path $_.OriginalFileName}}|
#Group drivers by original file name and identify groups with dupes
Group-Object -Property Name | Where-Object {$_.Count -gt 1} |
#In each group, exclude the newest driver (and rollback driver if -HideRollback is used)
#Add the rest to the array
ForEach-Object {$dupe += $_.Group | Sort-Object Date -Descending | Select-Object -Skip $hr}

#Calculate driver size
$dupe | ForEach-Object {
        #Add size info to the dupe driver object
        $_.Size = [math]::Round(((Get-ChildItem $_.Cat -Recurse | Measure-Object length -Sum).Sum)/1mb,1)
        #Calculate total size of dupe drivers
        $totalsize += $_.Size
    }

#dupe drivers total size for output
$totalsizetext = "Total size of duplicate drivers: $([math]::Round($totalsize,1)) MB"
#dupe drivers as table
$dupetable = $dupe | Sort-Object Name,Date -Descending | Format-Table ClassDescription, 
@{name="Provider"; expression= {$_.ProviderName.split(' ')[0]}}, 
@{name="Size (MB)"; expression= {$_.Size}}, Driver, Name, Version, 
@{name="Date"; expression= {"{0:yyyy-MM-dd}" -f $_.Date}}, BootCritical -Wrap

#output to txt and console
(Get-CimInstance Win32_OperatingSystem).Version | Tee-Object -FilePath $Outfile  -Append
$totalsizetext | Tee-Object -FilePath $Outfile -Append
$dupetable | Tee-Object -FilePath  $Outfile -Append 

#Create backup folder
New-Item -ItemType Directory -Path $Backup -Force

#Backup only the latest dupe drivers
$dupe | Group-Object -Property Name | ForEach-Object {
        $_.Group | Select-Object -First 1 | ForEach-Object {
                pnputil /export-driver $_.Driver $Backup
            }
    
"*WARNING*"
#Backup all drivers
$dupe | ForEach-Object {pnputil /export-driver $_.Driver $Backup}
#Delete specific dupe driver by original name
$dupe | Where-Object {$_.Name -eq 'igdlh64.inf'} | ForEach-Object {pnputil /delete-driver $_.Driver}
#Delete all dupe drivers
$dupe | ForEach-Object {pnputil /delete-driver $_.Driver}

# Thanks Vadim Sterkin
# http://www.outsidethebox.ms/20667
