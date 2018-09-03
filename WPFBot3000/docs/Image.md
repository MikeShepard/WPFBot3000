---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://docs.microsoft.com/en-us/dotnet/api/system.windows.controls.image
schema: 2.0.0
---

# Image

## SYNOPSIS
An Image control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.Image class

## SYNTAX

```
Image [[-Name] <String>] [[-ImageURI] <String>] [[-property] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
An Image control

## EXAMPLES

### EXAMPLE 1
```
Dialog {
```

Image -ImageUri C:\Windows\System32\SecurityAndMaintenance.png
} -Property @{ Title = 'Image' }

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

### -ImageURI
What image to display (in uri/path form)

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

## RELATED LINKS

[https://docs.microsoft.com/en-us/dotnet/api/system.windows.controls.image](https://docs.microsoft.com/en-us/dotnet/api/system.windows.controls.image)

