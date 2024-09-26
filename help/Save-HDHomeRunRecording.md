---
external help file: PSHDHomeRun-help.xml
Module Name: PSHDHomeRun
online version: https://github.com/RobBiddle/PSHDHomeRun
schema: 2.0.0
---

# Save-HDHomeRunRecording

## SYNOPSIS

Save HDHomeRun Recording to location specified.
Very Slow!
Seems to be throttled by the HDHomeRun device to playback speed.

## SYNTAX

Save-HDHomeRunRecording [-Filename] <String> [-PlayURL] <String> [[-SaveToDirectory] <Path>]
 [[-UnusedArguments] <Object>] [<CommonParameters>]

## DESCRIPTION

Save HDHomeRun Recording to location specified.
Very Slow!
Seems to be throttled by the HDHomeRun device to playback speed.
Upon Module import, the PSHDHomeRunSettings.json file is used to polulate values in the $PSHDHomeRunSettings variable.
Accepts pipeline input including extra properties from Get-HDHomeRunRecording.

## EXAMPLES

### EXAMPLE 1

```[PowerShell]
# Save the recording to the current directory
Save-HDHomeRunRecording -Filename "The_Simpsons_2024-01-01_12-00-00.ts" -PlayURL "<http://hdhr-11111111.local/recorded/12345678abcdef12>"
```

### EXAMPLE 2

```[PowerShell]
# Save the recording to a specific directory
Save-HDHomeRunRecording -Filename "The_Simpsons_2024-01-01_12-00-00.ts" -PlayURL "<http://hdhr-11111111.local/recorded/12345678abcdef12>" -SaveToDirectory "C:\Recordings"
```

### EXAMPLE 3

```[PowerShell]
# Save the recording to the current directory using pipeline input
Get-HDHomeRunRecording | Save-HDHomeRunRecording
```

## PARAMETERS

### -Filename

The Filename property from Get-HDHomeRunRecording output

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -PlayURL

The PlayURL property from Get-HDHomeRunRecording output

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -SaveToDirectory

The directory to save the recording to, default is the current directory.

```yaml
Type: System.IO.Path
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UnusedArguments

{{ Fill UnusedArguments Description }}

```yaml
Type: System.Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.IO.FileInfo

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
