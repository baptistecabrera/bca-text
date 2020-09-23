# Show-Error

Type: Function

Module: [Bca.Text](../ReadMe.md)

Shows an error message.
## Description
Shows an error message to the console.
## Syntax
```powershell
Show-Error [-Message] <string> [[-Width] <int>] [[-PaddingLeft] <int>] [[-PaddingRight] <int>] [<CommonParameters>]
```
## Examples
### Example 1
```powershell
Show-Error -Message "This is an error"
```
This example will show the error "This is an error".
## Parameters
### `-Message`
A string containing the message to show.

| | |
|:-|:-|
|Type:|String|
|Position:|0|
|Required:|True|
|Accepts pipepline input:|False|

### `-Width`
An integer specifying the width of the message.

| | |
|:-|:-|
|Type:|Int32|
|Default value:|`0`|
|Position:|1|
|Required:|False|
|Accepts pipepline input:|False|

### `-PaddingLeft`
An integer specifying the left padding of the message.

| | |
|:-|:-|
|Type:|Int32|
|Default value:|`0`|
|Position:|2|
|Required:|False|
|Accepts pipepline input:|False|

### `-PaddingRight`
An integer specifying the right padding of the message.

| | |
|:-|:-|
|Type:|Int32|
|Default value:|`0`|
|Position:|3|
|Required:|False|
|Accepts pipepline input:|False|

### `-<CommonParameters>`
This command supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, WarningVariable, OutBuffer, PipelineVariable, and OutVariable.
For more information, see [about_CommonParameters](https:/go.microsoft.com/fwlink/?LinkID=113216).
## Related Links
- [Show-Message](Show-Message.md)
