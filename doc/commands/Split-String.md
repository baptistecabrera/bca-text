# Split-String

Type: Function

Module: [Bca.Text](../ReadMe.md)

Splits a string.
## Description
Splits a string to make it fit in a specified width.
## Syntax
```powershell
Split-String [-String] <string> [[-Width] <int>] [[-PaddingLeft] <int>] [[-PaddingRight] <int>] [[-PaddingChar] <string>] [[-Offset] <int>] [<CommonParameters>]
```
## Parameters
### `-String`
A string containing the string to split.

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
|Default value:|$Host.UI.RawUI.MaxWindowSize.Width - $Host.UI.RawUI.CursorPosition.X|
|Position:|1|
|Required:|False|
|Accepts pipepline input:|False|

### `-PaddingLeft`
An integer specifying the left padding of the message.

| | |
|:-|:-|
|Type:|Int32|
|Default value:|0|
|Position:|2|
|Required:|False|
|Accepts pipepline input:|False|

### `-PaddingRight`
An integer specifying the right padding of the message.

| | |
|:-|:-|
|Type:|Int32|
|Default value:|0|
|Position:|3|
|Required:|False|
|Accepts pipepline input:|False|

### `-PaddingChar`

| | |
|:-|:-|
|Type:|String|
|Position:|4|
|Required:|False|
|Accepts pipepline input:|False|

### `-Offset`

| | |
|:-|:-|
|Type:|Int32|
|Default value:|0|
|Position:|5|
|Required:|False|
|Accepts pipepline input:|False|

## Inputs
**System.String**

You can pipe a value for the string to this cmdlet.
## Outputs
**System.String[]**

Returns a String array containing the split strings.
## Related Links
- [Show-Message](Show-Message.md)
