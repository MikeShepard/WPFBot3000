---
external help file: WPFBot3000-help.xml
Module Name: WPFBot3000
online version:
schema: 2.0.0
---

# Password

## SYNOPSIS
A password control

## SYNTAX

```
Password [[-Name] <String>] [[-InitialValue] <SecureString>] [[-property] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
A password control

## EXAMPLES

### EXAMPLE 1
```
Dialog {
```

Password SAPassword
} -title 'Enter the SA Password'

## PARAMETERS

### -Name
The name of the control

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

### -InitialValue
The password to be loaded initially.
Note that this is a secureString

```yaml
Type: SecureString
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
