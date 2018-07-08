---
external help file: WPFBot3000-help.xml
Module Name: WPFBot3000
online version:
schema: 2.0.0
---

# TextBlock

## SYNOPSIS
A textblock control

## SYNTAX

```
TextBlock [[-Text] <String>] [[-name] <String>] [[-property] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
A textblock control (i.e.
a static block of text, not to be confused with a textbox)

## EXAMPLES

### EXAMPLE 1
```
$text=get-content c:\windows\system32\drivers\etc\hosts | select -first 20
```

Dialog {
    TextBlock (\[string\]::Join("\`r\`n",$text))
}

## PARAMETERS

### -Text
The text to be loaded into the textblock

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

### -name
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

### -property
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
General notes

## RELATED LINKS
