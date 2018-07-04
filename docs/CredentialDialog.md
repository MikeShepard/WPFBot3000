---
external help file: wpf_dsl-help.xml
Module Name: wpf_dsl
online version:
schema: 2.0.0
---

# CredentialDialog

## SYNOPSIS
A control that encapsulates a credential.  Output value is a PSCredential object.

## SYNTAX

```
CredentialDialog [[-username] <PSCredential>] [<CommonParameters>]
```

## DESCRIPTION
A control that encapsulates a credential.  Output value is a PSCredential object.

## EXAMPLES

### EXAMPLE 1
```
Dialog {
       CredentialPicker User -username Mike
}

```

## PARAMETERS

### -username
The username for a new credential.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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
General notes

## RELATED LINKS
