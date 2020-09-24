function Show-Choice
{
    <#
        .SYNOPSIS
            Shows choices.
        .DESCRIPTION
            Shows choices to the console and returns the answer.
        .PARAMETER Choice
            A string array containing the possible choices.
        .PARAMETER Prompt
            A string containing the prompt to show.
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
            Returns an integer containing the index of the choice selected.
        .EXAMPLE
            Show-Choice  -Choice @( "Yes", "No" )

            Description
            -----------
            This example will show the choices and returns the choice selected.
        .NOTES
        .LINK
            Show-Message
        .LINK
            Show-Question
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string[]] $Choice,
        [Parameter(Mandatory = $false)]
        [string] $Prompt,
        [Parameter(Mandatory = $false)]
        [int] $Default = -1,
        [Parameter(Mandatory = $false)]
        [string] $Help = "",
        [Parameter(Mandatory = $false)]
        [int] $Width,
        [Parameter(Mandatory = $false)]
        [int] $PaddingLeft,
        [Parameter(Mandatory = $false)]
        [int] $PaddingRight
    )
    
    $PSBoundParameters.Add("Message", " ")
    $PSBoundParameters.Add("TextColor", $Host.UI.RawUI.ForegroundColor)
    $PSBoundParameters.Add("PrimaryColor", $Host.UI.RawUI.BackgroundColor)
    $PSBoundParameters.Add("SecondaryColor", $Host.UI.RawUI.BackgroundColor)
    $PSBoundParameters.Remove("Choice") | Out-Null
    $PSBoundParameters.Remove("Prompt") | Out-Null
    $PSBoundParameters.Remove("Default") | Out-Null
    $PSBoundParameters.Remove("Help") | Out-Null
    $Answer = " "
    $i = 1
    $Choice | ForEach-Object {
        $PSBoundParameters.Message = "[{0}] {1}" -f $i.ToString(("").PadLeft($Choice.Count.ToString().Length , "0")), $_
        if (($i - 1) -eq $Default) { $PSBoundParameters.TextColor = [System.ConsoleColor]::Yellow }
        else { $PSBoundParameters.TextColor = $Host.UI.RawUI.ForegroundColor }
        Show-Message @PSBoundParameters
        $i++
    }
    if ($Help)
    {
        $PSBoundParameters.Message = "[{0}] {1}" -f "?", $script:LocalizedData.Choice.Help
        $PSBoundParameters.TextColor = [System.ConsoleColor]::Cyan
        Show-Message @PSBoundParameters
    }
    Write-Host " "
    while (($Answer -eq "?") -or ($Answer -notmatch "^[\d\.]+$") -or (($Answer -as [int]) -lt 1) -or (($Answer -as [int]) -gt ($Choice.Count)))
    {
        if (!$Prompt) { $Prompt = $script:LocalizedData.Choice.YourAnswer }
        $DisplayPrompt = Format-String -String $Prompt -Widt $Width -PaddingLeft $PaddingLeft -PaddingRight $PaddingRight
        if ($Default -ge 0) { $DisplayPrompt += " " + ($script:LocalizedData.Choice.Default -f ($Default + 1)) }
        $Answer = Read-Host -Prompt $DisplayPrompt
        if (!$Answer -and ($Default -ge 0)) { $Answer = $Default + 1 }
        if (($Answer -eq "?") -and $Help)
        {
            Show-Information -Message $Help -Widt $Width -PaddingLeft $PaddingLeft -PaddingRight $PaddingRight
            $Answer = ""
        }
    }
    return ($Answer - 1)
}
