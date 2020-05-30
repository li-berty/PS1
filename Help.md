# Cheat sheet
+ **Executing a script**
>`powershell.exe –noexit &”c:\myscript.ps1”`  

+ **Important commands**
> To get help on a cmdlet *__get-help__*:  
`Get-Help Get-Service`  
List of all available cmdlets *__get-command__*:  
`Get-Command`  
All properties and methods of an item *__get-member__*:  
`Get-Service | Get-Member`  

+ **Setting the security policy**
>Reading and changing security policy *__Get-Execution__* and *__Set-Execution policy__*:  
`Get-Executionpolicy`  
`Set-Executionpolicy remotesigned`  

+ **Functions**
>Parameters are separated by a blank. Return value is optional.  
`function sum ([int]$a,[int]$b)`  
`{`  
` return $a + $b`  
`}`  
`sum 4 5`  

+ **Variables**
>Begin with $  
`$a = 42`  
Type specification:  
`[int]$a = 42`  

+ **Fields**
>Initialization:  
`$a = 1,2,4,8`  
Query:  
`$b = $a[3]`  

+ **Constants**
>Are created without $:  
`Set-Variable –name b –value 3.142 –option constant`  
And queried with $:  
`$b`  

+ **Using objects**
>To generate a new instance of a COM object *__New-Object -comobject (ProgID)__*:  
`$a = New-Object –comobject "wscript.network"`  
`$a.username`  
To generate an instance of a .NetFramework object (parameters can be transmitted when necessary) *__New-Object –type (.Net Object)__*:   
`$d = New-Object -Type System.DateTime 2006,12,25`  
`$d.get_DayOfWeek()`  

+ **Using user entries**
>Read-Host reads user entries:  
`$a = Read-Host “Enter your name”`  
`Write-Host "Hello" $a`

+ **Output to console**
>Variable name  
`$a` or `Write-Host $a –foregroundcolor “green”`


***
# Template
<pre>
###############################################################################################################
# Language    : PowerShel"
# Filename    : "
# Autor       : Berty Li (https://github.com/li-berty)"
# Description : "
# Version     : "
# Repository  : https://github.com/li-berty/--ENTERNAMEHERE--
###############################################################################################################
#
# Changelog
#
###############################################################################################################

<#
     .SYNOPSIS
    
     .DESCRIPTION
    
     .EXAMPLE
    
     .LINK
     https://github.com/li-berty/--ENTERNAMEHERE--
#>

[CmdletBinding()]

	param(
  
	)

	Begin{

	}

	Process{

	}

	End{

	}
</pre>
