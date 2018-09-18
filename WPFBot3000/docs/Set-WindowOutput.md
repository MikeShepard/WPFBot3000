---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.controls.separator
schema: 2.0.0
---

# Set-WindowOutput

## SYNOPSIS
Overrides the automatic output value of the window (and optionally closes it)

## SYNTAX

```
Set-WindowOutput [[-Window] <Object>] [[-OutputValue] <Object>] [-Close] [<CommonParameters>]
```

## DESCRIPTION
Provides a value to use as the output of the window instead of looking at control properties.
Use the -Close switch to cause the window to close

## EXAMPLES

### EXAMPLE 1
```
Set-WindowOutput -window $this.Window -OutputValue 'Hello' -close
```

## PARAMETERS

### -Window
The window object

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

### -OutputValue
The value to use as the output of the window

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

### -Close
Closes the window

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
