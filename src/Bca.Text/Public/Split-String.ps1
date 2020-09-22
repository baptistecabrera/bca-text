function Split-String
{
    <#
        .SYNOPSIS
            Splits a string.
        .DESCRIPTION
            Splits a string to make it fit in a specified width.
        .PARAMETER String
            A string containing the string to split.
        .PARAMETER Width
            An integer specifying the width to fit to.
        .PARAMETER PaddingLeft
            An integer specifying the left padding of the message.
        .PARAMETER PaddingRight
            An integer specifying the right padding of the message.
        .INPUTS
            System.String
            You can pipe a value for the string to this cmdlet.
        .OUTPUTS
            System.String[]
            Returns a String array containing the split strings.
        .NOTES
        .LINK
            Show-Message
    #>
    [CmdLetBinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string] $String,
        [Parameter(Mandatory = $false)]
        [int] $Width = $Host.UI.RawUI.MaxWindowSize.Width - $Host.UI.RawUI.CursorPosition.X,
        [Parameter(Mandatory = $false)]
        [int] $PaddingLeft,
        [Parameter(Mandatory = $false)]
        [int] $PaddingRight,
        [Parameter(Mandatory = $false)]
        [String] $PaddingChar = " ",
        [Parameter(Mandatory = $false)]
        [int] $Offset
    )

    $Message = $String
    $String = ""
    $Strings = @()
    $PaddingSize = $Offset + $PaddingLeft + $PaddingRight

    if ((($Message.Length + $PaddingSize) -gt $Width) -or ($Width -gt $Host.UI.RawUI.MaxWindowSize.Width))
    {
        $Message.Split(" ") | ForEach-Object {
            $Word = $_
            if (($String.Length + $Word.Length + 1) -ge ($Width - $PaddingSize))
            {
                if ($String) { $Strings += "{0}{1}{0}" -f $PaddingChar, $String.PadRight($Width - $PaddingSize, $PaddingChar) }
                $String = ""
                if ($Word.Length -ge ($Width - $PaddingSize))
                {
                    $Remaining = $Word
                    while ($Remaining)
                    {
                        if ($Remaining.Length -ge ($Width - $PaddingSize))
                        {
                            $TruncatedString = $Remaining.Substring(0, $Width - $PaddingSize)
                            $Remaining = $Remaining.Substring($Width - $PaddingSize)
                        }
                        else
                        {
                            $TruncatedString = $Remaining
                            $Remaining = ""
                        }
                        $Strings += "{0}{1}{0}" -f $PaddingChar, $TruncatedString.PadRight($Width - $PaddingSize, $PaddingChar)
                    }
                    $Word = ""
                }
            }
            if ($Word)
            {
                if ($String) { $String += " " }
                $String += $Word
            }
        }
        if ($String) { $Strings += "{0}{1}{0}" -f $PaddingChar, $String.PadRight($Width - $PaddingSize, $PaddingChar) }
    }
    else { $Strings += "{0}{1}{0}" -f $PaddingChar, $Message.PadRight($Width - $PaddingSize, $PaddingChar) }

    return $Strings
}