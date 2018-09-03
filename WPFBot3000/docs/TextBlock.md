---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.controls.textblock
schema: 2.0.0
---

# TextBlock

## SYNOPSIS
A TextBlock control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.TextBlock class

## SYNTAX

```
TextBlock [[-Text] <String>] [[-Name] <String>] [[-Property] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
A TextBlock control (i.e.
a static block of text, not to be confused with a TextBox)

## EXAMPLES

### EXAMPLE 1
```
$text = get-content c:\windows\system32\drivers\etc\hosts | select -first 20
```

Dialog {
    TextBlock (\[string\]::Join("\`r\`n",$text))
}

## PARAMETERS

### -Text
The text to be loaded into the TextBlock

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
the name of the control

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Property
Properties to extend/override the base properties defined in the function

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: @{}
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://msdn.microsoft.com/en-us/library/system.windows.controls.textblock](https://msdn.microsoft.com/en-us/library/system.windows.controls.textblock)

