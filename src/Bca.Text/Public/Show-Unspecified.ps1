function Show-Unspecified
{
    <#
        .SYNOPSIS
            Shows an unspecified message.
        .DESCRIPTION
            Shows an unspecified to the console.
        .PARAMETER Message
            A string containing the message to show.
        .PARAMETER Width
            An integer specifying the width of the message.
        .PARAMETER PaddingLeft
            An integer specifying the left padding of the message.
        .PARAMETER PaddingRight
            An integer specifying the right padding of the message.
        .EXAMPLE
            Show-Unspecified -Message "This is an unknown status"

            Description
            -----------
            This example will show the information "This is an unknown status".
        .NOTES
        .LINK
            Show-Message
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $Message,
        [Parameter(Mandatory = $false)]
        [int] $Width,
        [Parameter(Mandatory = $false)]
        [int] $PaddingLeft,
        [Parameter(Mandatory = $false)]
        [int] $PaddingRight
    )
    
    $PSBoundParameters.Add("Type", "Unspecified")
    Show-Message @PSBoundParameters
}