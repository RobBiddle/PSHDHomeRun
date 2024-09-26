---
external help file: PSHDHomeRun-help.xml
Module Name: PSHDHomeRun
online version: https://github.com/RobBiddle/PSHDHomeRun
schema: 2.0.0
---

# Get-HDHomeRunRecording

## SYNOPSIS

Get the list of recordings from the HDHomeRun DVR

## SYNTAX

Get-HDHomeRunRecording [[-HDHomeRunHostnameOrIp] <String>] [[-PSHDHomeRunSettingsFile] <String>]
 [[-UnusedArguments] <Object>] [<CommonParameters>]

## DESCRIPTION

Get the list of recordings from the HDHomeRun DVR

## EXAMPLES

### EXAMPLE 1

```[PowerShell]
# Returns all recordings from the HDHomeRun DVR using $Global:PSHDHomeRunSettings
Get-HDHomeRunRecording
```

### EXAMPLE 2

```[PowerShell]
# Returns all recordings from the HDHomeRun DVR, obtains HDHomeRunHostnameOrIp from PSHDHomeRunSettings.json
Get-HDHomeRunRecording -PSHDHomeRunSettingsFile .\PSHDHomeRunSettings.json
```

### EXAMPLE 3

```[PowerShell]
# Returns all recordings from the HDHomeRun DVR, specifies HDHomeRunHostnameOrIp explicitly by hostname
Get-HDHomeRunRecording -HDHomeRunHostnameOrIp HDHomeRun.local
```

### EXAMPLE 4

```[PowerShell]
# Returns all recordings from the HDHomeRun DVR, specifies HDHomeRunHostnameOrIp explicitly by IP address
Get-HDHomeRunRecording -HDHomeRunHostnameOrIp 192.168.1.2
```

## PARAMETERS

### -HDHomeRunHostnameOrIp

The hostname or IP address of the HDHomeRun device

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -PSHDHomeRunSettingsFile

The path to the PSHDHomeRunSettings.json file

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -UnusedArguments

{{ Fill UnusedArguments Description }}

```yaml
Type: System.Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
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
