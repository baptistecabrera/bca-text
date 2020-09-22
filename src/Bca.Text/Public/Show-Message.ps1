function Show-Message
{
    <#
        .SYNOPSIS
            Shows a message.
        .DESCRIPTION
            Shows a message to the console.
        .PARAMETER Message
            A string containing the message to show.
        .PARAMETER PrimaryColor
            A color to display as the accent.
        .PARAMETER SecondaryColor
            A color to display as the background of the message.
        .PARAMETER TextColor
            A color to display the message text.
        .PARAMETER Type
            A string containing the type of message.
        .PARAMETER Width
            An integer specifying the width of the message.
        .PARAMETER PaddingLeft
            An integer specifying the left padding of the message.
        .PARAMETER PaddingRight
            An integer specifying the right padding of the message.
        .EXAMPLE
            Show-Message -Message "This is a warning" -Type Warning

            Description
            -----------
            This example will show the warning "This is a warning".
        .EXAMPLE
            Show-Message -Message "This is a custom message" -PrimaryColor Red -SecondaryColor @{ R = 197; G = 15; B = 31 } -TextColor "#ffffff" -Widt 50 -PaddingLeft 3 -PaddingRight 2

            Description
            -----------
            This example will show the message "This is a custom message" with a width of 50, a left and right padding, and with the specified colors.
        .NOTES
        .LINK
            Write-HostRgb
        .LINK
            Show-Information
        .LINK
            Show-Question
        .LINK
            Show-Success
        .LINK
            Show-Warning
        .LINK
            Show-Error
        .LINK
            Show-Unspecified
        .LINK
            Show-Choice
        .LINK
            Split-String
    #>
    [CmdletBinding(DefaultParameterSetName = "FromType")]
    param(
        [Parameter(Mandatory = $true, ParameterSetName = "FromType")]
        [Parameter(Mandatory = $true, ParameterSetName = "FromColor")]
        [ValidateNotNullOrEmpty()]
        [string] $Message,
        [Parameter(Mandatory = $true, ParameterSetName = "FromColor")]
        [ValidateNotNullOrEmpty()]
        $PrimaryColor,
        [Parameter(Mandatory = $true, ParameterSetName = "FromColor")]
        [ValidateNotNullOrEmpty()]
        $SecondaryColor,
        [Parameter(Mandatory = $false, ParameterSetName = "FromColor")]
        [ValidateNotNullOrEmpty()]
        $TextColor = $Host.UI.RawUI.ForegroundColor,
        [Parameter(Mandatory = $false, ParameterSetName = "FromColor")]
        [ValidateNotNullOrEmpty()]
        [string] $MessageMarker = "~",
        [Parameter(Mandatory = $true, ParameterSetName = "FromType")]
        [ValidateNotNullOrEmpty()]
        [ValidateSet("Information", "Question", "Success", "Warning", "Error", "Unspecified")]
        [string] $Type,
        [Parameter(Mandatory = $false, ParameterSetName = "FromType")]
        [Parameter(Mandatory = $false, ParameterSetName = "FromColor")]
        [int] $Width = $Host.UI.RawUI.MaxWindowSize.Width - $Host.UI.RawUI.CursorPosition.X,
        [Parameter(Mandatory = $false, ParameterSetName = "FromType")]
        [Parameter(Mandatory = $false, ParameterSetName = "FromColor")]
        [int] $PaddingLeft,
        [Parameter(Mandatory = $false, ParameterSetName = "FromType")]
        [Parameter(Mandatory = $false, ParameterSetName = "FromColor")]
        [int] $PaddingRight,
        [Parameter(Mandatory = $false, ParameterSetName = "FromType")]
        [Parameter(Mandatory = $false, ParameterSetName = "FromColor")]
        [string] $PaddingChar = " "
    )

    switch ($Type)
    {
        "Information"
        {
            $PrimaryColor = [System.ConsoleColor]::Cyan
            $SecondaryColor = [System.ConsoleColor]::DarkCyan
            $MessageMarker = 'i'
        }
        "Question"
        {
            $PrimaryColor = [System.ConsoleColor]::Magenta
            $SecondaryColor = @{
                R = 136;
                G = 23;
                B = 152
            }
            $MessageMarker = '!'
        }
        "Success"
        {
            $PrimaryColor = [System.ConsoleColor]::Green
            $SecondaryColor = [System.ConsoleColor]::DarkGreen
            $MessageMarker = 'o'
        }
        "Warning"
        {
            $PrimaryColor = [System.ConsoleColor]::Yellow
            $SecondaryColor = @{
                R = 193;
                G = 156;
                B = 0
            }
            $MessageMarker = '!'
        }
        "Error"
        {
            $PrimaryColor = [System.ConsoleColor]::Red
            $SecondaryColor = [System.ConsoleColor]::DarkRed
            $MessageMarker = 'x'
        }
        "Unspecified"
        {
            $PrimaryColor = [System.ConsoleColor]::Gray
            $SecondaryColor = [System.ConsoleColor]::DarkGray
            $MessageMarker = '-'
        }
    }

    $Strings = Split-String -String $Message -Width $Width -PaddingLeft $PaddingLeft -PaddingRight $PaddingRight -PaddingChar $PaddingChar -Offset 3
    $Strings | ForEach-Object {
        if ($PaddingLeft) { Write-HostRgb ("{0}" -f ("").PadLeft($PaddingLeft, $PaddingChar)) -NoNewline }
        Write-HostRgb $MessageMarker -ForegroundColor $PrimaryColor -BackgroundColor $PrimaryColor -NoNewline
        Write-HostRgb $_ -BackgroundColor $SecondaryColor -ForegroundColor $TextColor
    }
}
