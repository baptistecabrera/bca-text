Import-Module .\Bca.Text.psd1 -Force

Write-HostRgb " "
Show-Error -Message "This is an error (with no width specified)."
Write-HostRgb " "
Show-Success -Message "This is a success (with a width of 50)." -Width 50
Write-HostRgb " "
Show-Warning -Message "This is warning (with no width specified and a left and right padding)." -PaddingLeft 3 -PaddingRight 2
Write-HostRgb " "
Show-Information -Message "This is an info (with a width of 20 and left padding)." -Width 20 -PaddingLeft 3
Write-HostRgb " "
Show-Unspecified -Message "This is an unspecified message (with truncated words)." -Width 10
Write-HostRgb " "
$Answer = Show-Question -Question "Is this a question?" -Choice @("This is an Answer", "And this is another answer")
Write-HostRgb " "
$Answer = Show-Question -Question "Is this a question with more than 10 choices and a default specified and padding and help?" -Choice @("This is an Answer", "And this is the default answer", "And this is another answer", "And this is another answer", "And this is another answer", "And this is another answer", "And this is another answer", "And this is another answer", "And this is another answer", "And this is another answer", "And this is another answer", "And this is another answer") -Default 1 -PaddingLeft 2 -PaddingRight 1 -Help "This is a helpful message"60
Write-HostRgb " "
$Answer = Show-Question -Question "Is this a question with no choices?"
Write-HostRgb " "
Show-Message -Message "This is a custom message (with a width of 30)." -PrimaryColor Magenta -SecondaryColor @{ R = 125; G = 125; B = 125 } -TextColor Cyan -Width 30
Write-HostRgb " "
Show-Message -Message "This is another very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very long custom message (with no width specified)." -PrimaryColor Blue -SecondaryColor DarkBlue -TextColor Cyan
Write-HostRgb " "
Write-HostRgb "This is a a test with NoNewLine: " -NoNewLine
Show-Message -Message "This is a custom message (after NoNewLine with no width specified)." -PrimaryColor Magenta -SecondaryColor @{ R = 125; G = 125; B = 125 } -TextColor Cyan
Write-HostRgb " "



$String = Format-String -String "Hello World (left align with left and right padding)!" -PaddingLeft 2 -PaddingRight 2
Write-HostRgb "-$($String)-"

$String = Format-String -String "Hello World (centered)!" -Align Center

Write-HostRgb $String 

$String = Format-String -String "Hello World (centered with a left padding)!" -Align Center -PaddingLeft 10

Write-HostRgb $String 

$String = Format-String -String "Hello World (right aligned)!" -Align Right

Write-HostRgb $String 

$String = Format-String -String "Hello World (right aligned with right padding)!" -Align Right -PaddingRight 3

Write-HostRgb $String #-BackgroundColor DarkRed

# to work on
# Split-String -String "This is another very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very long custom message (with no width specified)." | ForEach-Object {
#     Write-Host $_ -BackgroundColor Green
# }

# Show-Error -Message "This is another error3." -Width 50
# Write-Host " "
# Show-Error -Message "This is a long error error error error error error error error error error error error error error error error error error error error error error error error error error error error error !"
# Write-Host " "
# Show-Error -Message "This is a long error error error error error error error error error error error error error error error error error error error error error error error error error !" -Width 50
# Write-Host " "
# Show-Error -Message "This is a long error.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
# Write-Host " "
# Show-Error -Message "This is a long error.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -Width 50
# Write-Host " "
# Show-Information -Message "This is an information."
# Write-Host " "
# Show-Warning -Message "This is a warning."
# Write-Host " "
# Show-Unspecified -Message "This is an unspecified message."
# Write-Host " "
# Show-Message -Message "This is a custom message." -PrimaryColor Magenta -SecondaryColor DarkRed
# Write-Host " "
# Show-Message -Message "This is another custom message." -PrimaryColor Magenta -SecondaryColor DarkBlue -TextColor Cyan
# Write-Host " "
# Show-Message -Message "This is yet another custom message (secondary color is an hashtable)." -PrimaryColor Magenta -SecondaryColor @{ R = 125; G = 125; B = 125 } -TextColor Cyan
# Write-Host " "
# Show-Message -Message "This is yet another custom message (primary color is a psobject)." -PrimaryColor (New-Object -TypeName PsObject -Property @{ R = 125; G = 125; B = 125 }) -SecondaryColor Magenta -TextColor Cyan
# Write-Host " "
# Show-Message -Message "This is yet another custom message (secondary and text color are hex color)." -PrimaryColor Magenta -SecondaryColor "000000" -TextColor "#ffffff" -PaddingLeft 3
# Write-Host " "

$c = [system.ConsoleColor]::Red
$cStr = "Red"
$hex = "#ff0000"
$hex2 = "ff0000"
$h = @{ R = 1; G = 2; B = 3 }
$o = New-Object -TypeName PsObject -Property $h
$i = @( 125, 123, 124 )
$S = @( "125", "123", "124" )

# $c | Test-Color
# $hex | Test-Color
# $hex2 | Test-Color
# $cStr | Test-Color
# $h | Test-Color
# $o | test-Color
# Test-Color -Color $i
# Test-Color -Color $s
# $c | ConvertTo-Color
# $hex | ConvertTo-Color
# $hex2 | ConvertTo-Color
# $cStr | ConvertTo-Color
# $h | ConvertTo-Color
# $o | ConvertTo-Color
# ConvertTo-Color -Color $i
# ConvertTo-Color -Color $s

$c = "toto"
$cStr = "blop"
$h = @{ G = 2; B = 3 }
$h2 = @{ R = 261; G = 2; B = 3 }
$o = New-Object -TypeName PsObject -Property $h
$o2 = New-Object -TypeName PsObject -Property $h2
$i = 125
$i2 = @( 300, 123, 124 )
$S = @( "125", "300", "124" )
$hex = "#ffzz00"

# $c | Test-Color
# $cStr | Test-Color
# $h | Test-Color
# $hex | Test-Color
# $o | test-Color
# $h2 | Test-Color
# $o2 | test-Color
# $i | test-Color
# test-Color -Color $i2
# test-Color -Color $s
# $c | ConvertTo-Color
# $cStr | ConvertTo-Color
# $h | ConvertTo-Color
# $hex | ConvertTo-Color
# $o | ConvertTo-Color
# $h2 | ConvertTo-Color
# $o2 | ConvertTo-Color
# $i | ConvertTo-Color
# ConvertTo-Color -Color $i2
# ConvertTo-Color -Color $s
