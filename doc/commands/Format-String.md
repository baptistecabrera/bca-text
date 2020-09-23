# Format-String

Type: Function

Module: [Bca.Text](../ReadMe.md)

Formats a string.
## Description
Formats a string.
## Syntax
```powershell
Format-String [-String] <string> [[-Width] <int>] [[-Align] <string>] [[-PaddingLeft] <int>] [[-PaddingRight] <int>] [<CommonParameters>]
```
## Parameters
### `-String`
A string containing the string to format.

| | |
|:-|:-|
|Type:|String|
|Position:|0|
|Required:|True|
|Accepts pipepline input:|True|

### `-Width`
An integer specifying the width to fit to.

| | |
|:-|:-|
|Type:|Int32|
|Default value:|`$Host.UI.RawUI.MaxWindowSize.Width - $Host.UI.RawUI.CursorPosition.X`|
|Position:|1|
|Required:|False|
|Accepts pipepline input:|False|

### `-Align`
A string containing the alignment of the text.

| | |
|:-|:-|
|Type:|String|
|Default value:|`Left`|
|Position:|2|
|Required:|False|
|Accepts pipepline input:|False|
|Validation (ValidValues):|Center, Left, Right|

### `-PaddingLeft`
An integer specifying the left padding of the string.

| | |
|:-|:-|
|Type:|Int32|
|Default value:|`0`|
|Position:|3|
|Required:|False|
|Accepts pipepline input:|False|

### `-PaddingRight`
An integer specifying the right padding of the string.

| | |
|:-|:-|
|Type:|Int32|
|Default value:|`0`|
|Position:|4|
|Required:|False|
|Accepts pipepline input:|False|

### `-<CommonParameters>`
This command supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, WarningVariable, OutBuffer, PipelineVariable, and OutVariable.
For more information, see [about_CommonParameters](https:/go.microsoft.com/fwlink/?LinkID=113216).
## Inputs
**System.String**

You can pipe a value for the string to this cmdlet.
## Outputs
**System.String**

Returns a String containing the formated string.
