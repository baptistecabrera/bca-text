# Show-Information

Type: Function

Module: [Bca.Text](../ReadMe.md)

Shows an information message.
## Description
Shows an information to the console.
## Syntax
```powershell
Show-Information [-Message] <string> [[-Width] <int>] [[-PaddingLeft] <int>] [[-PaddingRight] <int>] [<CommonParameters>]
```
## Examples
### Example 1
```powershell
Show-Information -Message "This is an information"
```
This example will show the information "This is an information".
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
|Default value:|0|
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

## Related Links
- [Show-Message](Show-Message.md)
