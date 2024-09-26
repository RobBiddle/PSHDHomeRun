<#
    .SYNOPSIS
    Removes a recording from the HDHomeRun DVR. Very fast! Be careful!
    .DESCRIPTION
    Removes a recording from the HDHomeRun DVR via the CmdURL property.
    CmdURL is the only mandatory parameter
    Upon Module import, the PSHDHomeRunSettings.json file is used to polulate values in the $PSHDHomeRunSettings variable.
    Accepts pipeline input including extra properties from Get-HDHomeRunRecording.
    .LINK
    https://github.com/RobBiddle/PSHDHomeRun
    .EXAMPLE
    Remove-HDHomeRunRecording -CmdURL http://hdhr-11111111.local/recorded/cmd?id=12345678abcdef12
    .EXAMPLE
    # Remove ALL recordings using pipeline input
    Get-HDHomeRunRecording | Remove-HDHomeRunRecording
    .EXAMPLE
    # Remove a specific recording using pipeline input
    Get-HDHomeRunRecording | Where-Object { ($_.Title -eq "The Simpsons" -and ($_.EpisodeNumber -eq "S01E01" } | Remove-HDHomeRunRecording
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
    .PARAMETER CmdURL
    The CmdURL property from Get-HDHomeRunRecording output
    .PARAMETER ReRecord
    If 1, attempt to re-record the episode after deletion. Default is 0.
    .PARAMETER UnusedArguments
    Any arguments that are not used by this function
#>
function Remove-HDHomeRunRecording {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string]$CmdURL,
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true)]
        [int]$ReRecord = 0,
        [Parameter(ValueFromRemainingArguments)]
        $UnusedArguments
    )

    # Test if the CmdURL is a valid URL
    if (-not ($CmdURL -as [uri])) {
        Write-Error -Message "CmdURL is not a valid URL: $CmdURL"
        return
    }

    # Test if ReRecord is equal to 0 or 1
    if ($ReRecord -ne 0 -and $ReRecord -ne 1) {
        Write-Error -Message "ReRecord must be 0 or 1: $ReRecord"
        return
    }

    # Remove the recording
    Invoke-WebRequest -Method Post -Uri "$CmdURL&cmd=delete&rerecord=$Rerecord" -ErrorAction SilentlyContinue | Out-Null
}
