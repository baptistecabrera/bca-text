function Test-Color
{
    <#
        .SYNOPSIS
            Tests a color.
        .DESCRIPTION
            Tests a color.
        .PARAMETER Color
            An object representing the color.
            This can be
              - a ConsoleColor,
              - a String with the name of the ConsoleColor,
              - a String containing the hexadecimal color (with or without '#'),
              - an Hashtable or PSCustomObject containing R, G and B members,
              - an Integer array containing the values for R, G and B (in this order).
        .INPUTS
            System.Management.Automation.PSCustomObject
            You can pipe a value for the color to this cmdlet.
        .INPUTS
            System.ConsoleColor
            You can pipe a value for the color to this cmdlet.
        .INPUTS
            System.Hashtable
            You can pipe a value for the color to this cmdlet.
        .INPUTS
            System.String
            You can pipe a value for the color to this cmdlet.
        .OUTPUTS
            System.Boolean
            Returns a Boolean describing if the color is correct or not
        .EXAMPLE
            Test-Color -Color "Red"

            Description
            -----------
            This example will test the color with value "Red".
        .NOTES
            Arrays can not be piped to this function as they will be unwraped.
        .LINK
            ConvertTo-Color
    #>
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $Color
    )

    switch -Regex ($Color.GetType().Name)
    {
        "ConsoleColor" { $true }
        "Hashtable|PSCustomObject"
        {
            if (($Color.R -in 0..255) -and ($Color.G -in 0..255) -and ($Color.B -in 0..255)) { $true }
            else { $false }
        }
        "Object\[\]"
        {
            if (($Color.Count -eq 3) -and ($Color[0] -in 0..255) -and ($Color[1] -in 0..255) -and ($Color[2] -in 0..255)) { $true }
            else { $false }
        }
        "String"
        {
            if ($Color.StartsWith("#")) { $Color = $Color.Substring(1) }
            if ($Color -match '[A-Fa-f0-9]{6}') 
            {
                $ColorHash = @{
                    R = [convert]::ToInt32($Color.Substring(0, 2), 16);
                    G = [convert]::ToInt32($Color.Substring(2, 2), 16);
                    B = [convert]::ToInt32($Color.Substring(4, 2), 16)
                }
                $ColorHash | Test-Color
            }
            else
            {
                try
                {
                    [System.ConsoleColor] $Color = $Color
                    $true
                }
                catch { $false }
            }
        }
        default { $false }
    }
}