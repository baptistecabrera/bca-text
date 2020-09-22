# Show-Message

Type: Function

Module: [Bca.Text](../ReadMe.md)

Shows a message.
## Description
Shows a message to the console.
## Syntax
### FromType (default)
```powershell
Show-Message -Message <string> -Type <string> [-Width <int>] [-PaddingLeft <int>] [-PaddingRight <int>] [-PaddingChar <string>] [<CommonParameters>]
```
### FromColor
```powershell
Show-Message -Message <string> -PrimaryColor <Object> -SecondaryColor <Object> [-TextColor <Object>] [-MessageMarker <string>] [-Width <int>] [-PaddingLeft <int>] [-PaddingRight <int>] [-PaddingChar <string>] [<CommonParameters>]
```
## Examples
### Example 1
```powershell
Show-Message -Message "This is a warning" -Type Warning
```
This example will show the warning "This is a warning".
### Example 2
```powershell
Show-Message -Message "This is a custom message" -PrimaryColor Red -SecondaryColor @{ R = 197; G = 15; B = 31 } -TextColor "#ffffff" -Widt 50 -PaddingLeft 3 -PaddingRight 2
```
This example will show the message "This is a custom message" with a width of 50, a left and right padding, and with the specified colors.
## Parameters
### `-Message`
A string containing the message to show.

| | |
|:-|:-|
|Type:|String|
|Parameter sets:|FromColor, FromType|
|Position:|Named|
|Required:|True|
|Accepts pipepline input:|False|

### `-PrimaryColor`
A color to display as the accent.

| | |
|:-|:-|
|Type:|Object|
|Parameter sets:|FromColor|
|Position:|Named|
|Required:|True|
|Accepts pipepline input:|False|

### `-SecondaryColor`
A color to display as the background of the message.

| | |
|:-|:-|
|Type:|Object|
|Parameter sets:|FromColor|
|Position:|Named|
|Required:|True|
|Accepts pipepline input:|False|

### `-TextColor`
A color to display the message text.

| | |
|:-|:-|
|Type:|Object|
|Default value:|$Host.UI.RawUI.ForegroundColor|
|Parameter sets:|FromColor|
|Position:|Named|
|Required:|False|
|Accepts pipepline input:|False|

### `-MessageMarker`

| | |
|:-|:-|
|Type:|String|
|Default value:|~|
|Parameter sets:|FromColor|
|Position:|Named|
|Required:|False|
|Accepts pipepline input:|False|

### `-Type`
A string containing the type of message.

| | |
|:-|:-|
|Type:|String|
|Parameter sets:|FromType|
|Position:|Named|
|Required:|True|
|Accepts pipepline input:|False|
|Validation (ValidValues):|Information, Question, Success, Warning, Error, Unspecified|

### `-Width`
An integer specifying the width of the message.

| | |
|:-|:-|
|Type:|Int32|
|Default value:|$Host.UI.RawUI.MaxWindowSize.Width - $Host.UI.RawUI.CursorPosition.X|
|Parameter sets:|FromColor, FromType|
|Position:|Named|
|Required:|False|
|Accepts pipepline input:|False|

### `-PaddingLeft`
An integer specifying the left padding of the message.

| | |
|:-|:-|
|Type:|Int32|
|Default value:|0|
|Parameter sets:|FromColor, FromType|
|Position:|Named|
|Required:|False|
|Accepts pipepline input:|False|

### `-PaddingRight`
An integer specifying the right padding of the message.

| | |
|:-|:-|
|Type:|Int32|
|Default value:|0|
|Parameter sets:|FromColor, FromType|
|Position:|Named|
|Required:|False|
|Accepts pipepline input:|False|

### `-PaddingChar`

| | |
|:-|:-|
|Type:|String|
|Parameter sets:|FromColor, FromType|
|Position:|Named|
|Required:|False|
|Accepts pipepline input:|False|

## Related Links
- [Write-HostRgb](Write-HostRgb.md)
- [Show-Information](Show-Information.md)
- [Show-Question](Show-Question.md)
- [Show-Success](Show-Success.md)
- [Show-Warning](Show-Warning.md)
- [Show-Error](Show-Error.md)
- [Show-Unspecified](Show-Unspecified.md)
- [Show-Choice](Show-Choice.md)
- [Split-String](Split-String.md)
