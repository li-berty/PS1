"PowerShell methods for Encoding & Decoding Base64 `n"

"Encoding: `n"

$Text = Read-Host 'Enter your text for Encoding'

$UTF8 = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($Text))
$ASCII = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($Text))
$Unicode = [System.Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($Text))

"$Text (UTF8) to Base64 string: $UTF8"
"$Text (ASCII) to Base64 string: $ASCII"
"$Text (Unicode) to Base64 string: $Unicode `n"

"Decoding: `n"

$Base64 = '
ICAgICBfICAgICAgICAgICAgICAgICAgICAgICAgIF8KICAgIHxffCAgICAgICAgICAgICAgICAgICAgICAgfF98CiAgICB8IHwgICAgICAgICAvXl5eXCAgICAgICAgIHwgfAogICBffCB8XyAgICAgICh8ICJvIiB8KSAgICAgIF98IHxfCiBffCB8IHwgfCBfICAgIChfLS0tXykgICAgXyB8IHwgfCB8Xwp8IHwgfCB8IHwnIHwgICAgX3wgfF8gICAgfCAnfCB8IHwgfCB8CnwgICAgICAgICAgfCAgIC8gICAgIFwgICB8ICAgICAgICAgIHwKIFwgICAgICAgIC8gIC8gLyguIC4pXCBcICBcICAgICAgICAvCiAgIFwgICAgLyAgLyAvICB8IC4gfCAgXCBcICBcICAgIC8KICAgICBcICBcLyAvICAgIHx8WXx8ICAgIFwgXC8gIC8KICAgICAgXF9fLyAgICAgIHx8IHx8ICAgICAgXF9fLwogICAgICAgICAgICAgICAgKCkgKCkKICAgICAgICAgICAgICAgIHx8IHx8CiAgICAgICAgICAgICAgIG9vTyBPb28=
'

[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($UTF8))
[System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($Base64))
[System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($Unicode))
