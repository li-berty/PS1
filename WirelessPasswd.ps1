"PowerShell methods to extract saved wireless network profiles and passwords `n"

# Method_1
$profiles=((netsh wlan show profiles) -match '\s{2,}:\s') -replace '.*:\s' , ''; foreach ($name in $profiles){netsh wlan show profile $name key=clear}

# Method_2
(netsh wlan show profiles) | Select-String "\:(.+)$" | %{$name=$_.Matches.Groups[1].Value.Trim(); $_} | %{(netsh wlan show profile name="$name" key=clear)}
