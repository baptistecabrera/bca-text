function Write-HostRgb
{
     <#
        .SYNOPSIS
            Writes a message to the host.
        .DESCRIPTION
            Writes a message to the host console.
        .LINK
            Write-Host
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [object] $Object,
        [Parameter(Mandatory = $false)]
        $BackGroundColor,
        [Parameter(Mandatory = $false)]
        $ForeGroundColor,
        [Parameter(Mandatory = $false)]
        [object] $Separator,
        [Parameter(Mandatory = $false)]
        [switch] $NoNewLine
    )

    try
    {
        if ($BackGroundColor) { $BackGroundColor = ConvertTo-Color -Color $BackGroundColor -ErrorAction Stop }
        if ($ForeGroundColor) { $ForeGroundColor = ConvertTo-Color -Color $ForeGroundColor -ErrorAction Stop }
        if (($BackGroundColor -and ($BackGroundColor.GetType().Name -ne "ConsoleColor")) -or ($ForeGroundColor -and ($ForeGroundColor.GetType().Name -ne "ConsoleColor")))
        {
            $EscapeChar = [char]27
            $BackGroundColorString = ""
            $ForeGroundColorString = ""
            if ($BackGroundColor.GetType().Name -in "Hashtable", "PSCustomObject")
            {
                $BackGroundColorString = "48;2;{0};{1};{2}" -f $BackGroundColor.R, $BackGroundColor.G, $BackGroundColor.B
                $PSBoundParameters.Remove("BackGroundColor") | Out-Null
            }
            if ($ForeGroundColor.GetType().Name -in "Hashtable", "PSCustomObject")
            {
                $ForeGroundColorString = "38;2;{0};{1};{2}" -f $ForeGroundColor.R, $ForeGroundColor.G, $ForeGroundColor.B
                $PSBoundParameters.Remove("ForeGroundColor") | Out-Null
            }
            if ($BackGroundColorString -and $ForeGroundColorString) { $ColorString = "{0};{1}" -f $ForeGroundColorString, $BackGroundColorString }
            else { $ColorString = "{0}{1}" -f $ForeGroundColorString, $BackGroundColorString }
            $Object = "{0}[{1}m{2}{0}[0m" -f $EscapeChar, $ColorString, $Object
            $PSBoundParameters.Object = $Object
        }
        Write-Host @PSBoundParameters
    }
    catch { Write-Error $_ }
}