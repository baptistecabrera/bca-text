if (Test-Path (Join-Path $PSScriptRoot LocalizedData))
{
    $global:TestLocalizedData = Import-LocalizedData -BaseDirectory (Join-Path $PSScriptRoot LocalizedData) -ErrorAction SilentlyContinue
    if (!$?) { $global:TestLocalizedData = Import-LocalizedData -UICulture en-US -BaseDirectory (Join-Path $PSScriptRoot LocalizedData) }
}

Describe $global:TestLocalizedData.Module.Describe {
    BeforeAll {
        $ParentDirectory = Split-Path $PSScriptRoot -Parent
        $Directory = Split-Path $PSScriptRoot -Leaf

        if ([version]::TryParse($Directory, [ref]$null)) { $ModuleName = Split-Path $ParentDirectory -Leaf }
        else { $ModuleName = $Directory }
    }

    It $global:TestLocalizedData.Module.ImportModule {
        try
        {
            Import-Module (Join-Path $PSScriptRoot ("{0}.psd1" -f $ModuleName)) -Force
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $true
    }
    
    It $global:TestLocalizedData.Module.CommandCheck {
        $Commands = Get-Command -Module $ModuleName
        $Commands.Count | Should -BeGreaterThan 0
    }
}

Describe $global:TestLocalizedData.Message.Describe -Tags "WindowsOnly" {

    It $global:TestLocalizedData.Message.Tests {
        try
        {
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
            Show-Message -Message "This is a custom message (with a width of 30)." -PrimaryColor Magenta -SecondaryColor @{ R = 125; G = 125; B = 125 } -TextColor Cyan -Width 30
            Write-HostRgb " "
            Show-Message -Message "This is another very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very long custom message (with no width specified)." -PrimaryColor Blue -SecondaryColor DarkBlue -TextColor Cyan
            Write-HostRgb " "
            Write-HostRgb "This is a a test with NoNewLine: " -NoNewLine
            Show-Message -Message "This is a custom message (after NoNewLine with no width specified)." -PrimaryColor Magenta -SecondaryColor @{ R = 125; G = 125; B = 125 } -TextColor Cyan
            Write-HostRgb " "
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $true
    }
}

Describe $global:TestLocalizedData.Question.Describe -Tags "WindowsOnly" {
        
    It $global:TestLocalizedData.Question.QuestionChoice {
        Mock -CommandName Read-Host -ModuleName $ModuleName -MockWith { return "1" }
        try
        {
            $Answer = Show-Question -Question "Are you sure?" -Choice @("Yes", "No") -Prompt "Answer"
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $true
        $Answer | Should -BeExactly "0"
    }

    It $global:TestLocalizedData.Question.QuestionDefaultChoice {
        Mock -CommandName Read-Host -ModuleName $ModuleName -MockWith { return "" }
        try
        {
            $Answer = Show-Question -Question "Are you sure?" -Choice @("Yes", "No") -Default 0 -PaddingLeft 2 -PaddingRight 1 -Help "This is a helpful message"
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $true
        $Answer | Should -BeExactly "0"
    }

    It $global:TestLocalizedData.Question.QuestionNoChoice {
        Mock -CommandName Read-Host -ModuleName $ModuleName -MockWith { return "answer" }
        try
        {
            $Answer = Show-Question -Question "Question?"
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $true
        $Answer | Should -BeExactly "answer"
    }
}

Describe $global:TestLocalizedData.ConvertTest.DescribeConvert {

    BeforeAll {
        $Color = [system.ConsoleColor]::Red
        $String = "Red"
        $Hex = "#ff0000"
        $Hex2 = "ff0000"
        $Hash = @{ R = 1; G = 2; B = 3 }
        $Object = New-Object -TypeName PsObject -Property $Hash
        $IntArray = @( 125, 123, 124 )
        $StringArray = @( "125", "123", "124" )
    }

    It $global:TestLocalizedData.ConvertTest.Color {
        try
        {
            $ResultColor = $Color | ConvertTo-Color
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $true
        $ResultColor | Should -BeExactly "Red"
    }

    It $global:TestLocalizedData.ConvertTest.String {
        try
        {
            $ResultColor = $String | ConvertTo-Color
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $true
    }

    It $global:TestLocalizedData.ConvertTest.Hex {
        try
        {
            $ResultColor = $Hex | ConvertTo-Color
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $true
    }

    It $global:TestLocalizedData.ConvertTest.Hex2 {
        try
        {
            $ResultColor = $Hex2 | ConvertTo-Color
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $true
    }

    It $global:TestLocalizedData.ConvertTest.Hash {
        try
        {
            $ResultColor = $Hash | ConvertTo-Color
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $true
    }

    It $global:TestLocalizedData.ConvertTest.Object {
        try
        {
            $ResultColor = $Object | ConvertTo-Color
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $true
    }

    It $global:TestLocalizedData.ConvertTest.IntArray {
        try
        {
            $Result = ConvertTo-Color -Color $IntArray
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $true
    }

    It $global:TestLocalizedData.ConvertTest.StringArray {
        try
        {
            $Result = ConvertTo-Color -Color $StringArray
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $true
    }
}

Describe $global:TestLocalizedData.ConvertTest.DescribeConvert {

    BeforeAll {
        $Color = "toto"
        $String = "plop"
        $Hex = "#ffzz00"
        $Hex2 = "ffzz00"
        $Hash = @{ R = 260; G = 2; B = 3 }
        $Hash2 = @{ G = 2; B = 3 }
        $Object = New-Object -TypeName PsObject -Property $Hash
        $Object2 = New-Object -TypeName PsObject -Property $Hash2
        $IntArray = @( 300, 123, 124 )
        $StringArray = @( "125", "300", "124" )
    }

    It $global:TestLocalizedData.ConvertTest.Color {
        try
        {
            $ResultColor = $Color | ConvertTo-Color -ErrorActionStop
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $false
    }

    It $global:TestLocalizedData.ConvertTest.String {
        try
        {
            $ResultColor = $String | ConvertTo-Color -ErrorActionStop
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $false
    }

    It $global:TestLocalizedData.ConvertTest.Hex {
        try
        {
            $ResultColor = $Hex | ConvertTo-Color -ErrorActionStop
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $false
    }

    It $global:TestLocalizedData.ConvertTest.Hex2 {
        try
        {
            $ResultColor = $Hex2 | ConvertTo-Color -ErrorActionStop
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $false
    }

    It $global:TestLocalizedData.ConvertTest.Hash {
        try
        {
            $ResultColor = $Hash | ConvertTo-Color -ErrorActionStop
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $false
    }

    It $global:TestLocalizedData.ConvertTest.Hash {
        try
        {
            $ResultColor = $Hash2 | ConvertTo-Color -ErrorActionStop
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $false
    }

    It $global:TestLocalizedData.ConvertTest.Object {
        try
        {
            $ResultColor = $Object | ConvertTo-Color -ErrorActionStop
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $false
    }

    It $global:TestLocalizedData.ConvertTest.Object {
        try
        {
            $ResultColor = $Object2 | ConvertTo-Color -ErrorActionStop
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $false
    }

    It $global:TestLocalizedData.ConvertTest.IntArray {
        try
        {
            $Result = ConvertTo-Color -Color $IntArray -ErrorActionStop
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $false
    }

    It $global:TestLocalizedData.ConvertTest.StringArray {
        try
        {
            $Result = ConvertTo-Color -Color $StringArray -ErrorActionStop
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $false
    }
}

Describe $global:TestLocalizedData.ConvertTest.DescribeTest {

    BeforeAll {
        $Color = [system.ConsoleColor]::Red
        $String = "Red"
        $Hex = "#ff0000"
        $Hex2 = "ff0000"
        $Hash = @{ R = 1; G = 2; B = 3 }
        $Object = New-Object -TypeName PsObject -Property $Hash
        $IntArray = @( 125, 123, 124 )
        $StringArray = @( "125", "123", "124" )
    }

    It $global:TestLocalizedData.ConvertTest.Color {
        try
        {
            $Result = $Color | Test-Color
        }
        catch { $Result = $false }
        $Result | Should -Be $true
    }

    It $global:TestLocalizedData.ConvertTest.String {
        try
        {
            $Result = $String | Test-Color
        }
        catch { $Result = $false }
        $Result | Should -Be $true
    }

    It $global:TestLocalizedData.ConvertTest.Hex {
        try
        {
            $Result = $Hex | Test-Color
        }
        catch { $Result = $false }
        $Result | Should -Be $true
    }

    It $global:TestLocalizedData.ConvertTest.Hex2 {
        try
        {
            $Result = $Hex2 | Test-Color
        }
        catch { $Result = $false }
        $Result | Should -Be $true
    }

    It $global:TestLocalizedData.ConvertTest.Hash {
        try
        {
            $Result = $Hash | Test-Color
        }
        catch { $Result = $false }
        $Result | Should -Be $true
    }

    It $global:TestLocalizedData.ConvertTest.Object {
        try
        {
            $Result = $Object | Test-Color
        }
        catch { $Result = $false }
        $Result | Should -Be $true
    }

    It $global:TestLocalizedData.ConvertTest.IntArray {
        try
        {
            $Result = Test-Color -Color $IntArray
        }
        catch { $Result = $false }
        $Result | Should -Be $true
    }

    It $global:TestLocalizedData.ConvertTest.StringArray {
        try
        {
            $Result = Test-Color -Color $StringArray
        }
        catch { $Result = $false }
        $Result | Should -Be $true
    }
}

Describe $global:TestLocalizedData.ConvertTest.DescribeTest {

    BeforeAll {
        $Color = "toto"
        $String = "plop"
        $Hex = "#ffzz00"
        $Hex2 = "ffzz00"
        $Hash = @{ R = 260; G = 2; B = 3 }
        $Hash2 = @{ G = 2; B = 3 }
        $Object = New-Object -TypeName PsObject -Property $Hash
        $Object2 = New-Object -TypeName PsObject -Property $Hash2
        $IntArray = @( 300, 123, 124 )
        $StringArray = @( "125", "300", "124" )
    }

    It $global:TestLocalizedData.ConvertTest.Color {
        try
        {
            $Result = $Color | Test-Color -ErrorActionStop
        }
        catch { $Result = $true }
        $Result | Should -Be $false
    }

    It $global:TestLocalizedData.ConvertTest.String {
        try
        {
            $Result = $String | Test-Color -ErrorActionStop
        }
        catch { $Result = $true }
        $Result | Should -Be $false
    }

    It $global:TestLocalizedData.ConvertTest.Hex {
        try
        {
            $Result = $Hex | Test-Color -ErrorActionStop
        }
        catch { $Result = $true }
        $Result | Should -Be $false
    }

    It $global:TestLocalizedData.ConvertTest.Hex2 {
        try
        {
            $Result = $Hex2 | Test-Color -ErrorActionStop
        }
        catch { $Result = $true }
        $Result | Should -Be $false
    }

    It $global:TestLocalizedData.ConvertTest.Hash {
        try
        {
            $Result = $Hash | Test-Color -ErrorActionStop
        }
        catch { $Result = $true }
        $Result | Should -Be $false
    }

    It $global:TestLocalizedData.ConvertTest.Hash {
        try
        {
            $Result = $Hash2 | Test-Color -ErrorActionStop
        }
        catch { $Result = $true }
        $Result | Should -Be $false
    }

    It $global:TestLocalizedData.ConvertTest.Object {
        try
        {
            $Result = $Object | Test-Color -ErrorActionStop
        }
        catch { $Result = $true }
        $Result | Should -Be $false
    }

    It $global:TestLocalizedData.ConvertTest.Object {
        try
        {
            $Result = $Object2 | Test-Color -ErrorActionStop
        }
        catch { $Result = $true }
        $Result | Should -Be $false
    }

    It $global:TestLocalizedData.ConvertTest.IntArray {
        try
        {
            $Result = Test-Color -Color $IntArray -ErrorActionStop
        }
        catch { $Result = $true }
        $Result | Should -Be $false
    }

    It $global:TestLocalizedData.ConvertTest.StringArray {
        try
        {
            $Result = Test-Color -Color $StringArray -ErrorActionStop
        }
        catch { $Result = $true }
        $Result | Should -Be $false
    }
}

Describe $global:TestLocalizedData.Format.Describe {
    BeforeAll {
        $BaseString = "test"
        $Width = 12
        $LeftString = "test"
        $RightString = "        test"
        $CenterString = "    test    "
    }

    It $global:TestLocalizedData.Format.Left {
        try
        {
            $String = Format-String -String $BaseString -Width $Width -Align Left
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $true
        $String | Should -BeExactly $LeftString
    }
    
    It $global:TestLocalizedData.Format.Right {
        try
        {
            $String = Format-String -String $BaseString -Width $Width -Align Right
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $true
        $String | Should -BeExactly $RightString
    }

    It $global:TestLocalizedData.Format.Center {
        try
        {
            $String = Format-String -String $BaseString -Width $Width -Align Center
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $true
        $String | Should -BeExactly $CenterString
    }

    It $global:TestLocalizedData.Format.CenterPadding {
        try
        {
            $String = Format-String -String $BaseString -Width ($Width + 4) -Align Center -PaddingLeft 2 -PaddingRight 2
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $true
        $String | Should -BeExactly "  $CenterString  "
    }
}