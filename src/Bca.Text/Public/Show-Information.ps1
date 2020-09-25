function Show-Information
{
    <#
        .SYNOPSIS
            Shows an information message.
        .DESCRIPTION
            Shows an information to the console.
        .PARAMETER Message
            A string containing the message to show.
        .PARAMETER Width
            An integer specifying the width of the message.
        .PARAMETER PaddingLeft
            An integer specifying the left padding of the message.
        .PARAMETER PaddingRight
            An integer specifying the right padding of the message.
        .EXAMPLE
            Show-Information -Message "This is an information"

            Description
            -----------
            This example will show the information "This is an information".
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
    
    $PSBoundParameters.Add("Type", "Information")
    Show-Message @PSBoundParameters
}