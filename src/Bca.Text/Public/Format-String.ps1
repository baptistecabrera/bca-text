function Format-String
{
    <#
        .SYNOPSIS
            Formats a string.
        .DESCRIPTION
            Formats a string.
        .PARAMETER String
            A string containing the string to format.
        .PARAMETER Width
            An integer specifying the width to fit to.
        .PARAMETER Align
            A string containing the alignment of the text.
        .PARAMETER PaddingLeft
            An integer specifying the left padding of the string.
        .PARAMETER PaddingRight
            An integer specifying the right padding of the string.
        .INPUTS
            System.String
            You can pipe a value for the string to this cmdlet.
        .OUTPUTS
            System.String
            Returns a String containing the formated string.
        .NOTES
        .LINK
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $String,
        [Parameter(Mandatory = $false)]
        [int] $Width = $Host.UI.RawUI.MaxWindowSize.Width - $Host.UI.RawUI.CursorPosition.X,
        [Parameter(Mandatory = $false)]
        [ValidateSet("Center", "Left", "Right")]
        [string] $Align = "Left",
        [Parameter(Mandatory = $false)]
        [int] $PaddingLeft,
        [Parameter(Mandatory = $false)]
        [int] $PaddingRight
    )
    
    $String = "{0}{1}{2}" -f ("").PadLeft($PaddingLeft, " "), $String, ("").PadRight($PaddingRight, " ")
    
    switch ($Align)
    {
        "Center"
        {
            [int32] $Padding = ($Width - $String.Length) / 2
            $FullLength = $String.Length + $Padding * 2
            if ($FullLength -lt $Width) { $String = "{0}{1}{2}" -f ("").PadLeft($Padding, " "), $String, ("").PadRight($Padding + 1, " ") }
            elseif ($FullLength -eq $Width) { $String = "{0}{1}{2}" -f ("").PadLeft($Padding, " "), $String, ("").PadRight($Padding, " ") }
            else { $String = "{0}{1}{2}" -f ("").PadLeft($Padding, " "), $String, ("").PadRight($Padding - 1, " ") }
        }
        "Left" { $String = $String }
        "Right"
        {
            $String = "{0}{1}" -f ("").PadLeft($Width - $String.Length, " "), $String
        }
    }
    return $String
}