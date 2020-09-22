# Show-Choice

Type: Function

Module: [Bca.Text](../ReadMe.md)

Shows choices.
## Description
Shows choices to the console and returns the answer.
## Syntax
```powershell
Show-Choice [-Choice] <string[]> [[-Default] <int>] [[-Help] <string>] [[-Width] <int>] [[-PaddingLeft] <int>] [[-PaddingRight] <int>] [<CommonParameters>]
```
## Examples
### Example 1
```powershell
Show-Choice  -Choice @( "Yes", "No" )
```
This example will show the choices and returns the choice selected.
## Parameters
### `-Choice`
A string array containing the possible choices.

| | |
|:-|:-|
|Type:|String[]|
|Position:|0|
|Required:|True|
|Accepts pipepline input:|False|

### `-Default`
An integer containing the index of the default choice.

| | |
|:-|:-|
|Type:|Int32|
|Default value:|-1|
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
|Default value:|0|
|Position:|3|
|Required:|False|
|Accepts pipepline input:|False|

### `-PaddingLeft`
An integer specifying the left padding of the message.

| | |
|:-|:-|
|Type:|Int32|
|Default value:|0|
|Position:|4|
|Required:|False|
|Accepts pipepline input:|False|

### `-PaddingRight`
An integer specifying the right padding of the message.

| | |
|:-|:-|
|Type:|Int32|
|Default value:|0|
|Position:|5|
|Required:|False|
|Accepts pipepline input:|False|

## Outputs
**System.Int32**

Returns an integer containing the index of the choice selected.
## Related Links
- [Show-Message](Show-Message.md)
- [Show-Question](Show-Question.md)
