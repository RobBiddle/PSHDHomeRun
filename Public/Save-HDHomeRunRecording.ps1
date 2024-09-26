<#
    .SYNOPSIS
    Save HDHomeRun Recording to location specified. Very Slow! Seems to be throttled by the HDHomeRun device to playback speed.
    .DESCRIPTION
    Save HDHomeRun Recording to location specified. Very Slow! Seems to be throttled by the HDHomeRun device to playback speed.
    Upon Module import, the PSHDHomeRunSettings.json file is used to polulate values in the $PSHDHomeRunSettings variable.
    Accepts pipeline input including extra properties from Get-HDHomeRunRecording.
    .EXAMPLE
    # Save the recording to the current directory
    Save-HDHomeRunRecording -Filename "The_Simpsons_2024-01-01_12-00-00.ts" -PlayURL "http://hdhr-11111111.local/recorded/12345678abcdef12"
    .EXAMPLE
    # Save the recording to a specific directory
    Save-HDHomeRunRecording -Filename "The_Simpsons_2024-01-01_12-00-00.ts" -PlayURL "http://hdhr-11111111.local/recorded/12345678abcdef12" -SaveToDirectory "C:\Recordings"
    .EXAMPLE
    # Save the recording to the current directory using pipeline input
    Get-HDHomeRunRecording | Save-HDHomeRunRecording
    .PARAMETER Filename
    The Filename property from Get-HDHomeRunRecording output
    .PARAMETER PlayURL
    The PlayURL property from Get-HDHomeRunRecording output
    .PARAMETER SaveToDirectory
    The directory to save the recording to, default is the current directory.
    .PARAMETER UnusedArguments
    Any arguments that are not used by this function
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
    .OUTPUTS
    System.IO.FileInfo
#>
function  Save-HDHomeRunRecording {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string]$Filename,
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string]$PlayURL,
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $false)]
        [System.IO.Path]$SaveToDirectory,
        [Parameter(ValueFromRemainingArguments)]
        $UnusedArguments
    )

    if (-not $SaveToDirectory) {
        $SaveToDirectory = ".\"
    }
    
    # Remove invalid characters from the filename
    $invalidChars = [System.IO.Path]::GetInvalidFileNameChars() -join '\'
    $cleanFilename = $Filename -replace "[$invalidChars]", ''
    # Replace problematic characters with underscores
    $cleanFilename = $cleanFilename -replace '\[|\]', '_'
    # Replace spaces with underscores
    $cleanFilename = $cleanFilename -replace ' ', '_'
    # Replace multiple underscores with a single underscore
    $cleanFilename = $cleanFilename -replace '_+', '_'
    # Replace leading and trailing underscores
    $cleanFilename = $cleanFilename -replace '^_|_$', ''
    # Replace leading and trailing dots
    $cleanFilename = $cleanFilename -replace '^\._|\._$', ''
    # Replace leading and trailing dashes
    $cleanFilename = $cleanFilename -replace '^_|_$', ''

    # Save the recording to the specified directory
    $RecordingPath = Join-Path -Path $SaveToDirectory -ChildPath $cleanFilename
    Invoke-RestMethod -Method Get -Uri $PlayURL -OutFile $RecordingPath
}
