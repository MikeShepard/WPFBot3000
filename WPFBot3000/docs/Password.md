---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.controls.passwordbox
schema: 2.0.0
---

# Password

## SYNOPSIS
A Password control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.PasswordBox class

## SYNTAX

```
Password [[-Name] <String>] [[-InitialValue] <SecureString>] [[-Property] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
A Password control

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

[https://msdn.microsoft.com/en-us/library/system.windows.controls.passwordbox](https://msdn.microsoft.com/en-us/library/system.windows.controls.passwordbox)

