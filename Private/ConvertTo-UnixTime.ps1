<#
    .SYNOPSIS
    Invoke the HDHomeRun DVR cleanup process
    .DESCRIPTION
    Invoke the HDHomeRun DVR cleanup process
    .EXAMPLE
    ConvertTo-UnixTime.ps1 -DateTime (Get-Date)
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
    .PARAMETER DateTime
    The PowerShell Date object to convert
#>
function ConvertTo-UnixTime {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [datetime]$DateTime
    )
    # Unix epoch starts at 1970-01-01 00:00:00 UTC
    $epoch = New-Object -Type DateTime -ArgumentList 1970, 1, 1, 0, 0, 0, ([DateTimeKind]::Utc)
    return ($DateTime.ToUniversalTime() - $epoch).TotalSeconds
}
