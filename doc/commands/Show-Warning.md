# Show-Warning

Type: Function

Module: [Bca.Text](../ReadMe.md)

Shows a warning message.
## Description
Shows a warning message to the console.
## Syntax
```powershell
Show-Warning [-Message] <string> [[-Width] <int>] [[-PaddingLeft] <int>] [[-PaddingRight] <int>] [<CommonParameters>]
```
## Examples
### Example 1
```powershell
Show-Warning -Message "This is a warning"
```
This example will show the warning "This is a warning".
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
