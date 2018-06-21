---
external help file: wpf_dsl-help.xml
Module Name: wpf_dsl
online version:
schema: 2.0.0
---

# Merge-HashTable

## SYNOPSIS
Adds items from the "Extension" hashtable to the "Base" hashtable

## SYNTAX

```
Merge-HashTable [[-Base] <Hashtable>] [[-Extension] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
Used to override a hashtable of base properties and values with customised versions.

## EXAMPLES

### EXAMPLE 1
```
$prop1=@{Height=30;Title='Example'}
```

$prop2=@{Title='Updated'}

Merge-Hashtable -base $prop1 -extension $prop2

Name                           Value
----                           -----
Title                          Updated
Height                         30

## PARAMETERS

### -Base
Hashtable with base values

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Extension
Hashtable with overrides of base values or extra properties

```yaml
Type: Hashtable
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
