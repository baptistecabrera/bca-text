@{
    Module  = @{
        Describe     = "Module"
        ImportModule = "Importation locale du module."
        CommandCheck = "Vérification du nombre de fonctions exportées."
    }

    Message     = @{
        Describe = "Show-Messages"
        Tests    = "Test des messages"
    }

    Question    = @{
        Describe              = "Show-Question"
        QuestionChoice        = "Question avec choix"
        QuestionDefaultChoice = "Question avec choix par défaut"
        QuestionNoChoice      = "Question sans choix"
    }
    
    ConvertTest = @{
        DescribeConvert = "ConvertTo-Color"
        DescribeTest    = "Test-Color"
        Color           = "Depuis ConsoleColor"
        String          = "Depuis String"
        Hex             = "Depuis Hexadecimal"
        Hex2            = "Depuis Hexadecimal sans « # »"
        Hash            = "Depuis Hashtable"
        Object          = "Depuis Object"
        IntArray        = "Depuis Int array"
        StringArray     = "Depuis String array"
        Float           = "Depuis Float"
    }

    Format      = @{
        Describe      = "Format-String"
        Left          = "Alignement gauche"
        Right         = "Alignement droite"
        Center        = "Alignement centre"
        CenterPadding = "Alignement centre avec padding"
    }

}