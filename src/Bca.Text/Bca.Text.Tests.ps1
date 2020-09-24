if (Test-Path (Join-Path $PSScriptRoot LocalizedData))
{
    $global:TestLocalizedData = Import-LocalizedData -BaseDirectory (Join-Path $PSScriptRoot LocalizedData) -ErrorAction SilentlyContinue
    if (!$?) { $global:TestLocalizedData = Import-LocalizedData -UICulture en-US -BaseDirectory (Join-Path $PSScriptRoot LocalizedData) }
}

if (Test-Path (Join-Path $PSScriptRoot LocalizedData))
{
    $script:LocalizedData = Import-LocalizedData -BaseDirectory (Join-Path $PSScriptRoot LocalizedData) -ErrorAction SilentlyContinue
    if (!$?) { $script:LocalizedData = Import-LocalizedData -UICulture en-US -BaseDirectory (Join-Path $PSScriptRoot LocalizedData) }
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

Describe $global:TestLocalizedData.Message.Describe {

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
    
    Context $global:TestLocalizedData.Message.QuestionChoice.Context {

        Mock -CommandName "Read-Host" -ModuleName "Bca.Text" -MockWith {
            return "0"
        } -ParameterFilter { $Prompt -eq ($global:LocalizedData.Choice.YourAnswer + ($global:LocalizedData.Choice.Default -f "0")) }

        It $global:TestLocalizedData.Message.QuestionChoice.Test {
            try
            {
                $Answer = Show-Question -Question "Are you sure?" -Choice @("Yes", "No") -Default 0
                $Result = $true
            }
            catch { $Result = $false }
            $Result | Should -Be $true
            $Answer | Should -BeExactly 0
        }

    }
}