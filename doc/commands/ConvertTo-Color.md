# ConvertTo-Color

Type: Function

Module: [Bca.Text](../ReadMe.md)

Converts to a color.
## Description
Converts to a color.
## Syntax
```powershell
ConvertTo-Color [-Color] <Object> [<CommonParameters>]
```
## Examples
### Example 1
```powershell
ConvertTo-Color -Color "Red"
```
This example will test the color with value "Red".
## Parameters
### `-Color`
An object representing the color.
This can be
    - a ConsoleColor,
    - a String with the name of the ConsoleColor,
    - a String containing the hexadecimal color (with or without '#'),
    - an Hashtable or PSCustomObject containing R, G and B members,
    - an Integer array containing the values for R, G and B (in this order).

| | |
|:-|:-|
|Type:|Object|
|Position:|0|
|Required:|True|
|Accepts pipepline input:|True|

### `-<CommonParameters>`
This command supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, WarningVariable, OutBuffer, PipelineVariable, and OutVariable.
For more information, see [about_CommonParameters](https:/go.microsoft.com/fwlink/?LinkID=113216).
## Inputs

**System.Management.Automation.PSCustomObject**

You can pipe a value for the color to this cmdlet.

**System.ConsoleColor**

You can pipe a value for the color to this cmdlet.

**System.Hashtable**

You can pipe a value for the color to this cmdlet.

**System.String**

You can pipe a value for the color to this cmdlet.
## Notes
Arrays can not be piped to this function as they will be unwraped.
## Related Links
- [Test-Color](Test-Color.md)
