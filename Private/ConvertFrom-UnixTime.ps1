<#
    .SYNOPSIS
    Convert from Unix Time to a PowerShell Date object
    .DESCRIPTION
    Convert from Unix Time to a PowerShell Date object
    .EXAMPLE
    ConvertFrom-UnixTime 1632960000
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
    .PARAMETER UnixTime
    The Unix Epoch formatted Timestamp to convert
#>
# Function to convert from Unix Time to a PowerShell Date object
function ConvertFrom-UnixTime {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$UnixTime
    )
    # Unix epoch starts at 1970-01-01 00:00:00 UTC
    $epoch = New-Object -Type DateTime -ArgumentList 1970, 1, 1, 0, 0, 0, ([DateTimeKind]::Utc)
    return $epoch.AddSeconds($UnixTime).ToLocalTime()
}
