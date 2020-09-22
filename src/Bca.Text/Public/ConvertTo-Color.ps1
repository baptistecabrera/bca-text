function ConvertTo-Color
{
    <#
        .SYNOPSIS
            Converts to a color.
        .DESCRIPTION
            Converts to a color.
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
        .EXAMPLE
            ConvertTo-Color -Color "Red"

            Description
            -----------
            This example will test the color with value "Red".
        .NOTES
        .LINK
            Test-Color
    #>
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $Color
    )

    switch -Regex ($Color.GetType().Name)
    {
        "ConsoleColor" { $Color }
        "Hashtable|PSCustomObject"
        {
            if ((Test-Color -Color $Color)) { $Color }
            else { Write-Error -Message "Color must contain R, G and B values between 0 and 255." -Category InvalidData -CategoryActivity $MyInvocation.MyCommand -TargetType "Color" -TargetName $Color.GetType().Name -Exception InvalidDataException }
        }
        "Object\[\]"
        {
            $ColorMap = @{
                R = $Color[0];
                G = $Color[1];
                B = $Color[2];
            }
            if ((Test-Color -Color $ColorMap)) { $ColorMap }
            else { Write-Error -Message "Color must contain R, G and B values between 0 and 255." -Category InvalidData -CategoryActivity $MyInvocation.MyCommand -TargetType "Color" -TargetName $Color.GetType().Name -Exception InvalidDataException }
        }
        "String"
        {
            if ($Color.StartsWith("#")) { $Color = $Color.Substring(1) }
            if ($Color -match '[A-Fa-f0-9]{6}') 
            {
                $ColorMap = @{
                    R = [convert]::ToInt32($Color.Substring(0, 2), 16);
                    G = [convert]::ToInt32($Color.Substring(2, 2), 16);
                    B = [convert]::ToInt32($Color.Substring(4, 2), 16)
                }
                if ((Test-Color -Color $ColorMap)) { $ColorMap }
                else { Write-Error -Message "Hex color '$Color' is not valide." -Category InvalidData -CategoryActivity $MyInvocation.MyCommand -TargetType "Color" -TargetName $Color.GetType().Name -Exception InvalidDataException }
            }
            else
            {
                try
                {
                    [System.ConsoleColor] $Color = $Color
                    $Color
                }
                catch { Write-Error $_ }
            }
        }
        default { Write-Error -Message "Color type '$($Color.GetType().Name)' is not valid." -Category InvalidArgument -CategoryActivity $MyInvocation.MyCommand -TargetType "Color" -TargetName $Color.GetType().Name -Exception InvalidArgumentException }
    }
}