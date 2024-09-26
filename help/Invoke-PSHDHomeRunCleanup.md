---
external help file: PSHDHomeRun-help.xml
Module Name: PSHDHomeRun
online version: https://github.com/RobBiddle/PSHDHomeRun
schema: 2.0.0
---

# Invoke-PSHDHomeRunCleanup

## SYNOPSIS

Invoke the HDHomeRun DVR cleanup process.
Very fast!
Be careful!

## SYNTAX

Invoke-PSHDHomeRunCleanup [[-HDHomeRunHostnameOrIp] <String>] [[-SettingsFilePath] <String>] [[-ReRecord] <Int32>]
 [[-Title] <String>] [[-NumberOfEpisodesToKeep] <Int32>] [[-DeleteOlderThanDays] <Int32>] [[-SortBy] <String>]
 [<CommonParameters>]

## DESCRIPTION

Invoke the HDHomeRun DVR cleanup process which will delete recordings older than the specified
number of days in the PSHDHomeRunSettings.json file.
If the ReRecord parameter is set to 1,
the episode will be re-recorded if it airs again.
If the ReRecord parameter is set to 0, the
episode will not be re-recorded.
The default value for ReRecord is 0.

## EXAMPLES

### EXAMPLE 1

```[PowerShell]
Invoke the HDHomeRun DVR cleanup process with parameters loaded during Module import
Invoke-PSHDHomeRunCleanup.ps1
```

### EXAMPLE 2

```[PowerShell]
# Invoke the HDHomeRun DVR cleanup process with parameters from the PSHDHomeRunSettings.json file
Invoke-PSHDHomeRunCleanup.ps1 -SettingsFilePath ".\PSHDHomeRunSettings.json"
```

### EXAMPLE 3

```[PowerShell]
# Invoke the HDHomeRun DVR cleanup process with explicit parameters
Invoke-PSHDHomeRunCleanup.ps1 -HDHomeRunHostnameOrIp "HDHomeRun.local" \`
    -Title "Jeopardy!" \`
    -NumberOfEpisodesToKeep 4 \`
    -DeleteOlderThanDays 30 \`
    -SortBy "OriginalAirdate"
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

### -SettingsFilePath

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

### -ReRecord

If 1, attempt to re-record the episode after deletion.
Default is 0.

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Title

{{ Fill Title Description }}

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -NumberOfEpisodesToKeep

{{ Fill NumberOfEpisodesToKeep Description }}

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -DeleteOlderThanDays

{{ Fill DeleteOlderThanDays Description }}

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -SortBy

{{ Fill SortBy Description }}

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: True (ByPropertyName)
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
