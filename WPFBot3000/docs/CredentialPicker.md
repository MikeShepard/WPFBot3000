---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version:
schema: 2.0.0
---

# CredentialPicker

## SYNOPSIS
A control that allows input of credentials and encapsulates the Windows Presentation Foundation (WPF) System.Management.Automation.PsCredential.GetNetworkCredential class

## SYNTAX

```
CredentialPicker [[-Name] <String>] [[-InitialValue] <PSCredential>] [<CommonParameters>]
```

## DESCRIPTION
A control that allows input of credentials

## EXAMPLES

### EXAMPLE 1
```
Dialog {
```

CredentialPicker MyCreds
}

#dialog with a place to request credentials (initially blank)

## PARAMETERS

### -Name
The name of the control.

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
The credentials loaded into the control

```yaml
Type: PSCredential
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

[General notes	https://docs.microsoft.com/en-us/dotnet/api/system.management.automation.pscredential]()

