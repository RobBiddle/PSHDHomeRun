---
external help file: PSHDHomeRun-help.xml
Module Name: PSHDHomeRun
online version: https://github.com/RobBiddle/PSHDHomeRun
schema: 2.0.0
---

# Get-PSHDHomeRunSetting

## SYNOPSIS

Get the Settings which should be stored in PSHDHomeRunSettings.json file.

## SYNTAX

Get-PSHDHomeRunSetting [[-Path] <Object>] [<CommonParameters>]

## DESCRIPTION

Get the Settings which should be stored in PSHDHomeRunSettings.json file, although you can rename the file if you want.
Upon Module import, the PSHDHomeRunSettings.json file is used to populate values in the $PSHDHomeRunSettings variable.
If you rename the file you will always need to provide the path to the file for this and other functions in PSHDHomeRun.

## EXAMPLES

### EXAMPLE 1

```[PowerShell]
Get-PSHDHomeRunSetting
```

### EXAMPLE 2

```[PowerShell]
Get-PSHDHomeRunSetting -Path .\PSHDHomeRunSettings.json
```

## PARAMETERS

### -Path

The path to the PSHDHomeRunSettings.json file

```yaml
Type: System.Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Management.Automation.PSCustomObject

## NOTES

PSHDHomeRun - Manage HDHomeRun DVR using PowerShell and JSON
Copyright (C) 2024 Robert D. Biddle

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.
If not, see \<<https://www.gnu.org/licenses/\>>.

## RELATED LINKS

[https://github.com/RobBiddle/PSHDHomeRun](https://github.com/RobBiddle/PSHDHomeRun)
