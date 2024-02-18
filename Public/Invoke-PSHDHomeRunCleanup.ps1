<#
    .SYNOPSIS
    Invoke the HDHomeRun DVR cleanup process. Very fast! Be careful!
    .DESCRIPTION
    Invoke the HDHomeRun DVR cleanup process which will delete recordings older than the specified 
    number of days in the PSHDHomeRunSettings.json file. If the ReRecord parameter is set to 1,
    the episode will be re-recorded if it airs again. If the ReRecord parameter is set to 0, the
    episode will not be re-recorded. The default value for ReRecord is 0.
    .EXAMPLE
    Invoke the HDHomeRun DVR cleanup process with parameters loaded during Module import
    Invoke-PSHDHomeRunCleanup.ps1
    .EXAMPLE
    Invoke the HDHomeRun DVR cleanup process with parameters from the PSHDHomeRunSettings.json file
    Invoke-PSHDHomeRunCleanup.ps1 -SettingsFilePath ".\PSHDHomeRunSettings.json"
    .EXAMPLE
    Invoke the HDHomeRun DVR cleanup process with explicit parameters
    Invoke-PSHDHomeRunCleanup.ps1 -HDHomeRunDevice "HDHomeRun.local" `
        -Title "Jeopardy!" `
        -NumberOfEpisodesToKeep 4 `
        -DeleteOlderThanDays 30 `
        -SortBy "OriginalAirdate"
    .LINK
    https://github.com/RobBiddle/PSHDHomeRun
    .NOTES
    PSHDHomeRun - Manage HDHomeRun DVR using PowerShell and JSON
    Copyright (C) 2024 Robert D. Biddle

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
    .PARAMETER HDHomeRunDevice
    The hostname or IP address of the HDHomeRun device
    .PARAMETER SettingsFilePath
    The path to the PSHDHomeRunSettings.json file
    .PARAMETER Title
    The Title of the series to cleanup
    .PARAMETER NumberOfEpisodesToKeep
    The number of episodes to keep
    .PARAMETER DeleteOlderThanDays
    The number of days to keep episodes
    .PARAMETER SortBy
    The property to sort by. Valid values are "OriginalAirdate" or "StartTime". Default is "StartTime".
    .PARAMETER ReRecord
    If 1, attempt to re-record the episode after deletion. Default is 0.
#>
function Invoke-PSHDHomeRunCleanup {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true)]
        [string]$HDHomeRunDevice,
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true)]
        [string]$SettingsFilePath,
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true)]
        [int]$ReRecord = 0,
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true)]
        [string]$Title,
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true)]
        [int]$NumberOfEpisodesToKeep,
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true)]
        [int]$DeleteOlderThanDays,
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true)]
        [ValidateSet("OriginalAirdate", "StartTime")]
        [string]$SortBy
    )

    if ($PSHDHomeRunSettingsFile) {
        # Test if the file exists
        if (-not (Test-Path -Path $PSHDHomeRunSettingsFile)) {
            Write-Error -Message "File not found: $PSHDHomeRunSettingsFile"
            return
        }
        
        $PSHDHomeRunSettings = Get-PSHDHomeRunSetting -Path $PSHDHomeRunSettingsFile
    }
    else {
        $PSHDHomeRunSettings = $Global:PSHDHomeRunSettings
    }

    if ($PSHDHomeRunSettings.HDHomeRunHostnameOrIp) {
        $HDHomeRunDevice = $PSHDHomeRunSettings.HDHomeRunHostnameOrIp
    }

    if (-not $HDHomeRunDevice) {
        $HDHomeRunDevice = "HDHomeRun.local"
    }

    $DeletedEpisodes = @()
    # Get the list of recordings
    $Recordings = Get-HDHomeRunRecording -HDHomeRunHostnameOrIp $HDHomeRunDevice
    # Group the recordings by Title
    $RecordingsByTitle = $Recordings | Group-Object -Property Title
    # Loop through each Title
    foreach ($TitleGroup in $RecordingsByTitle) {
        # Set the SortBy to OriginalAirdate or RecordingDate based on either the SortBy parameter or the PSHDHomeRunSettings.json file
        if ($SortBy) {
            $SortBy = $SortBy
        }
        elseif (($null -ne $TitleGroup.Name) -and $TitleGroup.Name -in $PSHDHomeRunSettings.SettingsSeries.SeriesTitle) {
            $SortBy = $PSHDHomeRunSettings.SettingsSeries | Where-Object { $_.SeriesTitle -eq $TitleGroup.Name } | Select-Object -ExpandProperty SortBy
        }
        elseif ($PSHDHomeRunSettings.SettingsGlobal.SortBy) {
            $SortBy = $PSHDHomeRunSettings.SettingsGlobal.SortBy
        }
        else {
            $SortBy = "StartTime"
        }

        # Set the NumberOfEpisodesToKeep based on either the NumberOfEpisodesToKeep parameter or the PSHDHomeRunSettings.json file
        if ($NumberOfEpisodesToKeep) {
            $NumberOfEpisodesToKeep = $NumberOfEpisodesToKeep
        }
        elseif (($null -ne $TitleGroup.Name) -and $TitleGroup.Name -in $PSHDHomeRunSettings.SettingsSeries.SeriesTitle) {
            $NumberOfEpisodesToKeep = $PSHDHomeRunSettings.SettingsSeries | Where-Object { $_.SeriesTitle -eq $TitleGroup.Name } | Select-Object -ExpandProperty NumberOfEpisodesToKeep
        }
        elseif ($PSHDHomeRunSettings.SettingsGlobal.NumberOfEpisodesToKeep) {
            $NumberOfEpisodesToKeep = $PSHDHomeRunSettings.SettingsGlobal.NumberOfEpisodesToKeep
        }
        else {
            $NumberOfEpisodesToKeep = 9999999 # Default to a large number so that nothing is deleted
        }

        if ($DeleteOlderThanDays) {
            $DeleteOlderThanDays = $DeleteOlderThanDays
        }
        elseif (($null -ne $TitleGroup.Name) -and $TitleGroup.Name -in $PSHDHomeRunSettings.SettingsSeries.SeriesTitle) {
            $DeleteOlderThanDays = $PSHDHomeRunSettings.SettingsSeries | Where-Object { $_.SeriesTitle -eq $TitleGroup.Name } | Select-Object -ExpandProperty DeleteOlderThanDays
        }
        elseif ($PSHDHomeRunSettings.SettingsGlobal.DeleteOlderThanDays) {
            $DeleteOlderThanDays = $PSHDHomeRunSettings.SettingsGlobal.DeleteOlderThanDays
        }
        else {
            $DeleteOlderThanDays = 9999999 # Default to a large number so that nothing is deleted
        }

        # Set the ReRecord based on either the ReRecord parameter or the PSHDHomeRunSettings.json file
        if ($ReRecord) {
            $ReRecord = $ReRecord
        }
        elseif (($null -ne $TitleGroup.Name) -and $TitleGroup.Name -in $PSHDHomeRunSettings.SettingsSeries.SeriesTitle) {
            $ReRecord = $PSHDHomeRunSettings.SettingsSeries | Where-Object { $_.SeriesTitle -eq $TitleGroup.Name } | Select-Object -ExpandProperty ReRecord
        }
        elseif ($PSHDHomeRunSettings.SettingsGlobal.ReRecord) {
            $ReRecord = $PSHDHomeRunSettings.SettingsGlobal.ReRecord
        }
        else {
            $ReRecord = 0
        }

        # Sort the recordings by $SortBy and delete the oldest recordings based on $DeleteOlderThanDays
        $TitleGroup.Group | Sort-Object -Property $SortBy -Descending | ForEach-Object {
            # If the recording is older than $DeleteOlderThanDays, delete it
            if ((Get-Date) - $_.$SortBy -gt (New-TimeSpan -Days $DeleteOlderThanDays)) {
                $DeletedEpisodes += $_
                Write-Output "Deleting: $($_.Title) - $($_.EpisodeTitle) - $($_.OriginalAirdate)"
                Write-Output "$($_.$SortBy) is older than $DeleteOlderThanDays days"
                Remove-HDHomeRunRecording -CmdURL $_.CmdURL -ReRecord $ReRecord
                # Remove the episode from the list so we don't attempt to delete again
                $TitleGroup.Group.Remove($_)
            }
        }

        # Sort the recordings by $SortBy and delete the oldest recordings based on $NumberOfEpisodesToKeep
        $TitleGroup.Group | Sort-Object -Property $SortBy -Descending | Select-Object -Skip $NumberOfEpisodesToKeep | ForEach-Object {
            $DeletedEpisodes += $_
            Write-Output "Deleting: $($_.Title) - $($_.EpisodeTitle) - $($_.OriginalAirdate)"
            Write-Output "$($_.Title) episode count of $($TitleGroup.Group.count) exceeds NumberOfEpisodesToKeep: $NumberOfEpisodesToKeep"
            Remove-HDHomeRunRecording -CmdURL $_.CmdURL -ReRecord $ReRecord
            # Remove the episode from the list so we don't attempt to delete again
            $TitleGroup.Group.Remove($_)
        }
    }
    
    # Return the deleted episodes
    Write-Output "The following episodes were deleted:"
    $DeletedEpisodes
}
