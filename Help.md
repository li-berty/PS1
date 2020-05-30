# Cheat sheet
**Important commands**  
To get help on a cmdlet *__get-help__*:  
`Get-Help Get-Service`  
List of all available cmdlets *__get-command__*:  
`Get-Command`  
All properties and methods of an item *__get-member__*:  
`Get-Service | Get-Member`  

**Setting the security policy**  
Reading and changing security policy *__Get-Execution__* and *__Set-Execution policy__*:  
`Get-Executionpolicy`  
`Set-Executionpolicy remotesigned`  

**Executing a script**  
<mark>powershell.exe –noexit &”c:\myscript.ps1”</mark>

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
