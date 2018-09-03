---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.shapes.rectangle
schema: 2.0.0
---

# Register-WPFDSLContentControl

## SYNOPSIS
Creates a WPFBot3000 cmdlet for a control that can contain a single control

## SYNTAX

```
Register-WPFDSLContentControl [[-Name] <String>] [[-TypeName] <String>] [-HideLabel] [<CommonParameters>]
```

## DESCRIPTION
Creates a WPFBot3000 cmdlet for a control that can contain a single control

## EXAMPLES

### EXAMPLE 1
```
Register-WPFDSLContentControl -Name Brd -Typename System.Windows.Controls.Border -hidelabel
```

dialog {
    Brd Items {
                TextBox Name
                TextBox Address
    }
}

## PARAMETERS

### -Name
The name of the cmdlet to be created

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

### -TypeName
The type name of the control to be "wrapped"

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

### -HideLabel
Whether the control shows a label or not

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
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
