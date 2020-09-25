function Show-Error
{
    <#
        .SYNOPSIS
            Shows an error message.
        .DESCRIPTION
            Shows an error message to the console.
        .PARAMETER Message
            A string containing the message to show.
        .PARAMETER Width
            An integer specifying the width of the message.
        .PARAMETER PaddingLeft
            An integer specifying the left padding of the message.
        .PARAMETER PaddingRight
            An integer specifying the right padding of the message.
        .EXAMPLE
            Show-Error -Message "This is an error"

            Description
            -----------
            This example will show the error "This is an error".
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
    
    $PSBoundParameters.Add("Type", "Error")
    Show-Message @PSBoundParameters
}
