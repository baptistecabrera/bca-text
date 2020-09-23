# Show-Question

Type: Function

Module: [Bca.Text](../ReadMe.md)

Shows a question message.
## Description
Shows a question message to the console.
## Syntax
```powershell
Show-Question [-Question] <string> [[-Choice] <string[]>] [[-Help] <string>] [[-Width] <int>] [[-Default] <int>] [[-PaddingLeft] <int>] [[-PaddingRight] <int>] [<CommonParameters>]
```
## Examples
### Example 1
```powershell
Show-Question -Question "Is this a question?" -Choice @( "Yes", "No" )
```
This example will show the question "Is this a question?" and returns the choice selected.
### Example 2
```powershell
Show-Question -Question "Can you tell me more about you?"
```
This example will show the question "Can you tell me more about you?" and returns the user input.
## Parameters
### `-Question`
A string containing the question to show.

| | |
|:-|:-|
|Type:|String|
|Position:|0|
|Required:|True|
|Accepts pipepline input:|False|

### `-Choice`
A string array containing the possible choices.
If not choice is specified, the answer will be user input.

| | |
|:-|:-|
|Type:|String[]|
|Position:|1|
|Required:|False|
|Accepts pipepline input:|False|

### `-Help`
A string containing a help message.

| | |
|:-|:-|
|Type:|String|
|Position:|2|
|Required:|False|
|Accepts pipepline input:|False|

### `-Width`
An integer specifying the width of the message.

| | |
|:-|:-|
|Type:|Int32|
|Default value:|`$Host.UI.RawUI.MaxWindowSize.Width - $Host.UI.RawUI.CursorPosition.X`|
|Position:|3|
|Required:|False|
|Accepts pipepline input:|False|

### `-Default`
An integer containing the index of the default choice.

| | |
|:-|:-|
|Type:|Int32|
|Default value:|`-1`|
|Position:|4|
|Required:|False|
|Accepts pipepline input:|False|

### `-PaddingLeft`
An integer specifying the left padding of the message.

| | |
|:-|:-|
|Type:|Int32|
|Default value:|`0`|
|Position:|5|
|Required:|False|
|Accepts pipepline input:|False|

### `-PaddingRight`
An integer specifying the right padding of the message.

| | |
|:-|:-|
|Type:|Int32|
|Default value:|`0`|
|Position:|6|
|Required:|False|
|Accepts pipepline input:|False|

### `-<CommonParameters>`
This command supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, WarningVariable, OutBuffer, PipelineVariable, and OutVariable.
For more information, see [about_CommonParameters](https:/go.microsoft.com/fwlink/?LinkID=113216).
## Outputs
**System.Int32**

Returns an integer containing the index of the choice selected if choices are provided.
**System.String**

Returns a string containing the the user's answer if no choices are provided.
## Related Links
- [Show-Message](Show-Message.md)
- [Show-Choice](Show-Choice.md)
