@{
    Module      = @{
        Describe     = "Module"
        ImportModule = "Importing module locally."
        CommandCheck = "Checking exported commands count."
    }

    Message     = @{
        Describe = "Show-Messages"
        Tests    = "Testing messages"
    }

    Question    = @{
        Describe              = "Show-Question"
        QuestionChoice        = "Question with choices"
        QuestionDefaultChoice = "Question with default choice"
        QuestionNoChoice      = "Question without choice"
    }
    
    ConvertTest = @{
        Describe    = "ConvertTo-Color/Test-Color"
        Color       = "From ConsoleColor"
        String      = "From String"
        Hex         = "From Hexadecimal code"
        Hex2        = "From Hexadecimal code without '#'"
        Hash        = "From Hashtable"
        Object      = "From Object"
        IntArray    = "From Int array"
        StringArray = "From String array"
    }

    Format      = @{
        Describe      = "Format-String"
        Left          = "Align left"
        Right         = "Align right"
        Center        = "Align center"
        CenterPadding = "Align center with padding"
    }
}