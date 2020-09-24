function Show-Question
{
    <#
        .SYNOPSIS
            Shows a question message.
        .DESCRIPTION
            Shows a question message to the console.
        .PARAMETER Question
            A string containing the question to show.
        .PARAMETER Prompt
            A string containing the prompt to show.
        .PARAMETER Choice
            A string array containing the possible choices.
            If not choice is specified, the answer will be user input.
        .PARAMETER Help
            A string containing a help message.
        .PARAMETER Default
            An integer containing the index of the default choice.
        .PARAMETER Width
            An integer specifying the width of the message.
        .PARAMETER PaddingLeft
            An integer specifying the left padding of the message.
        .PARAMETER PaddingRight
            An integer specifying the right padding of the message.
        .OUTPUTS
            System.Int32
            Returns an integer containing the index of the choice selected if choices are provided.
        .OUTPUTS
            System.String
            Returns a string containing the the user's answer if no choices are provided.
        .EXAMPLE
            Show-Question -Question "Is this a question?" -Choice @( "Yes", "No" )

            Description
            -----------
            This example will show the question "Is this a question?" and returns the choice selected.
        .EXAMPLE
            Show-Question -Question "Can you tell me more about you?"

            Description
            -----------
            This example will show the question "Can you tell me more about you?" and returns the user input.
        .NOTES
        .LINK
            Show-Message
        .LINK
            Show-Choice
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $Question,
        [Parameter(Mandatory = $false)]
        [string] $Prompt,
        [Parameter(Mandatory = $false)]
        [string[]] $Choice,
        [Parameter(Mandatory = $false)]
        [string] $Help = "",
        [Parameter(Mandatory = $false)]
        [int] $Width = $Host.UI.RawUI.MaxWindowSize.Width - $Host.UI.RawUI.CursorPosition.X,
        [Parameter(Mandatory = $false)]
        [int] $Default = -1,
        [Parameter(Mandatory = $false)]
        [int] $PaddingLeft,
        [Parameter(Mandatory = $false)]
        [int] $PaddingRight
    )
    
    Show-Message -Message $Question -Type Question -Width $Width -PaddingLeft $PaddingLeft -PaddingRight $PaddingRight
    if ($Choice) { Show-Choice -Choice $Choice -Prompt $Prompt -Width $Width -PaddingLeft $PaddingLeft -PaddingRight $PaddingRight -Default $Default -Help $Help }
    else
    { 
        if (!$Prompt) { $Prompt = $script:LocalizedData.Choice.YourAnswer }
        Read-Host -Prompt (Format-String -String $Prompt -Widt $Width -PaddingLeft $PaddingLeft -PaddingRight $PaddingRight)
    }
}