---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version:
schema: 2.0.0
---

# Register-WPFDSLContentControl

## SYNOPSIS
Creates a WPFBot3000 cmdlet for a control that can contain a single control

## SYNTAX

```
Register-WPFDSLContentControl [[-Name] <Object>] [[-TypeName] <Object>] [-HideLabel] [<CommonParameters>]
```

## DESCRIPTION
Creates a WPFBot3000 cmdletfor a control that can contain a single control

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
Type: Object
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
Type: Object
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
General notes

## RELATED LINKS
