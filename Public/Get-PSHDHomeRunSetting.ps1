<#
    .SYNOPSIS
    Get the Settings which should be stored in PSHDHomeRunSettings.json file.
    .DESCRIPTION
    Get the Settings which should be stored in PSHDHomeRunSettings.json file, although you can rename the file if you want.
    Upon Module import, the PSHDHomeRunSettings.json file is used to populate values in the $PSHDHomeRunSettings variable.
    If you rename the file you will always need to provide the path to the file for this and other functions in PSHDHomeRun.
    .EXAMPLE
    Get-PSHDHomeRunSetting
    .EXAMPLE
    Get-PSHDHomeRunSetting -Path .\PSHDHomeRunSettings.json
    .LINK
    https://github.com/RobBiddle/PSHDHomeRun
    .OUTPUTS
    System.Management.Automation.PSCustomObject
    .PARAMETER Path
    The path to the PSHDHomeRunSettings.json file
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
#>
function Get-PSHDHomeRunSetting {
    [CmdletBinding()]
    param (
        $Path
    )
    
    if (-not $Path) {
        if (Test-Path -Path ".\PSHDHomeRunSettings.json") {
            $Path = ".\PSHDHomeRunSettings.json"
        }
        elseif (Test-Path -Path (Join-Path -Path (Split-Path -Parent $PSScriptRoot) -ChildPath "PSHDHomeRunSettings.json")) {
            $Path = Join-Path -Path (Split-Path -Parent $PSScriptRoot) -ChildPath "PSHDHomeRunSettings.json"
            Write-Warning -Message "Using EXAMPLE PSHDHomeRunSettings.json from Module directory: $Path"
        }
        else {
            Write-Error -Message "File not found: PSHDHomeRunSettings.json"
            return
        }
    }

    # Test if the file exists
    if (-not (Test-Path -Path $Path)) {
        Write-Error -Message "File not found: $Path"
        return
    }

    # Read in PSHDHomeRunSettings.json
    $PSHDHomeRunSettings = Get-Content -Path $Path -Raw | ConvertFrom-Json
    # Return the settings
    return $PSHDHomeRunSettings
}
