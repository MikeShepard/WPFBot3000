---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.shapes.rectangle
schema: 2.0.0
---

# Register-WPFAttachedPropertyType

## SYNOPSIS
Registers the typename and property prefix of an attached property

## SYNTAX

```
Register-WPFAttachedPropertyType [[-TypeName] <String>] [[-PropertyPrefix] <String>] [<CommonParameters>]
```

## DESCRIPTION
Registers the typename and property prefix of an attached property. 
for instance, to handle the Grid.Row, attached property
you would register System.Window.Controls.Grid with the prefix Grid.

## EXAMPLES

### EXAMPLE 1
```
Register-WPFAttachedPropertyType -TypeName System.Windows.Controls.DockPanel -PropertyPrefix DockPanel
```

## PARAMETERS

### -TypeName
The name of the type which provides the attached property (like System.Window.Controls.Grid )

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

### -PropertyPrefix
The property prefix of the attached property (like Grid)

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
