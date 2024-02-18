---
external help file: PSHDHomeRun-help.xml
Module Name: PSHDHomeRun
online version: https://github.com/RobBiddle/PSHDHomeRun
schema: 2.0.0
---

# Remove-HDHomeRunRecording

## SYNOPSIS

Removes a recording from the HDHomeRun DVR.
Very fast!
Be careful!

## SYNTAX

Remove-HDHomeRunRecording [-CmdURL] <String> [[-ReRecord] <Int32>] [[-UnusedArguments] <Object>]
 [<CommonParameters>]

## DESCRIPTION

Removes a recording from the HDHomeRun DVR via the CmdURL property.
CmdURL is the only mandatory parameter
Upon Module import, the PSHDHomeRunSettings.json file is used to polulate values in the $PSHDHomeRunSettings variable.
Accepts pipeline input including extra properties from Get-HDHomeRunRecording.

## EXAMPLES

### EXAMPLE 1

```[PowerShell]
Remove-HDHomeRunRecording.ps1 -CmdURL http://hdhr-11111111.local/recorded/cmd?id=12345678abcdef12
```

### EXAMPLE 2

```[PowerShell]
# Remove ALL recordings using pipeline input
Get-HDHomeRunRecording | Remove-HDHomeRunRecording
```

### EXAMPLE 3

```[PowerShell]
# Remove a specific recording using pipeline input
Get-HDHomeRunRecording | Where-Object { ($_.Title -eq "The Simpsons" -and ($_.EpisodeNumber -eq "S01E01" } | Remove-HDHomeRunRecording
```

## PARAMETERS

### -CmdURL

The CmdURL property from Get-HDHomeRunRecording output

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

### -ReRecord

If 1, attempt to re-record the episode after deletion.
Default is 0.

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 0
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
