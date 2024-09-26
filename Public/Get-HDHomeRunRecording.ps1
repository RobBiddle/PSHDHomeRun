<#
    .SYNOPSIS
    Get the list of recordings from the HDHomeRun DVR
    .DESCRIPTION
    Get the list of recordings from the HDHomeRun DVR
    .EXAMPLE
    # Returns all recordings from the HDHomeRun DVR using $Global:PSHDHomeRunSettings
    Get-HDHomeRunRecording
    .EXAMPLE
    # Returns all recordings from the HDHomeRun DVR, obtains HDHomeRunHostnameOrIp from PSHDHomeRunSettings.json
    Get-HDHomeRunRecording -PSHDHomeRunSettingsFile .\PSHDHomeRunSettings.json
    .EXAMPLE
    # Returns all recordings from the HDHomeRun DVR, specifies HDHomeRunHostnameOrIp explicitly by hostname
    Get-HDHomeRunRecording -HDHomeRunHostnameOrIp HDHomeRun.local
    .EXAMPLE
    # Returns all recordings from the HDHomeRun DVR, specifies HDHomeRunHostnameOrIp explicitly by IP address
    Get-HDHomeRunRecording -HDHomeRunHostnameOrIp 192.168.1.2
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
    .PARAMETER HDHomeRunHostnameOrIp
    The hostname or IP address of the HDHomeRun device
    .PARAMETER PSHDHomeRunSettingsFile
    The path to the PSHDHomeRunSettings.json file
    .PARAMETER UnusedArguments
    Any arguments that are not used by this function
    .OUTPUTS
    System.Management.Automation.PSCustomObject
#>
function  Get-HDHomeRunRecording {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true)]
        [string]$HDHomeRunHostnameOrIp,
        [Parameter(Mandatory = $false, ValueFromPipelineByPropertyName = $true)]
        [string]$PSHDHomeRunSettingsFile,
        [Parameter(ValueFromRemainingArguments)]
        $UnusedArguments
    )

    if ($PSHDHomeRunSettingsFile){
        # Test if the file exists
        if (-not (Test-Path -Path $PSHDHomeRunSettingsFile)) {
            Write-Error -Message "File not found: $PSHDHomeRunSettingsFile"
            return
        }
        
        $PSHDHomeRunSettings = Get-PSHDHomeRunSetting -Path $PSHDHomeRunSettingsFile
    } else {
        $PSHDHomeRunSettings = $Global:PSHDHomeRunSettings
    }

    if (-NOT $HDHomeRunHostnameOrIp -and -NOT $PSHDHomeRunSettings.HDHomeRunHostnameOrIp) {
        Write-Error "HDHomeRunHostnameOrIp is not specified. Please specify the IP address or hostname of the HDHomeRun device."
        return
    }

    if ($HDHomeRunHostnameOrIp) {
        $HDHomeRunDevice = $HDHomeRunHostnameOrIp
    } else {
        $HDHomeRunDevice = $PSHDHomeRunSettings.HDHomeRunHostnameOrIp
    }

    if (-not $HDHomeRunDevice) {
        # If PowerShell is running on Windows
        if ($PSVersionTable.Platform -eq "Win32NT") {
            $HDHomeRunDevice = ([System.Net.Dns]::GetHostAddresses("HDHomeRun.local") | Where-Object AddressFamily -eq "InterNetwork")[0].IPAddressToString
        }
        # If PowerShell is running on Linux
        elseif ($PSVersionTable.Platform -eq "Unix") {
            try {
                $HDHomeRunDevice = ([System.Net.Dns]::GetHostAddresses("HDHomeRun.local") | Where-Object AddressFamily -eq "InterNetwork")[0].IPAddressToString
            } catch {
                try {
                    if (-NOT (Get-Module -Name "DnsClient-PS" -ListAvailable)) {
                        Write-Warning "DNS lookup on linux system failed. DnsClient-PS module not found. Attempting to install it now."
                        $installnow = Read-Host "Would you like to install DnsClient-PS now? (Y/N)"
                        if ($installnow -eq "Y") {
                            Install-Module -Name "DnsClient-PS" -Force
                        }
                    } else {
                        try {
                            $HDHomeRunDevice = (Resolve-DnsName -Name "HDHomeRun.local" -QueryType -ThrowDnsErrors).IPAddress
                        } catch {
                            Write-Error "Unable to resolve HDHomeRun.local to an IP address. Please specify the IP address or hostname of the HDHomeRun device."
                        }
                    }
                }
                catch {
                    Write-Error $Error[0]
                }
            }
        }
    }

    # Get the list of recordings from the HDHomeRun DVR
    $Recordings = @()
    $RecordedSeries = Invoke-RestMethod -Method Get -Uri http://$HDHomeRunDevice/recorded_files.json
    foreach ($Series in $RecordedSeries) {
        $EpisodesList = $Series.EpisodesURL
        $Episodes = Invoke-RestMethod -Method Get -Uri $EpisodesList
        foreach ($Episode in $Episodes) {
            $Recordings += $Episode
        }
    }

    # Create a new PSObject with the data we want
    # Note that we are converting the Unix Time to a PowerShell Date object
    $RecordingsPSObj = $Recordings | ForEach-Object {
        [PSCustomObject]@{
            Title           = $_.Title
            EpisodeTitle    = $_.EpisodeTitle
            EpisodeNumber   = $_.EpisodeNumber
            Synopsis        = $_.Synopsis
            OriginalAirdate = ConvertFrom-UnixTime $_.OriginalAirdate
            Filename        = $_.Filename
            RecordEndTime   = ConvertFrom-UnixTime $_.RecordEndTime
            RecordError     = $_.RecordError
            RecordStartTime = ConvertFrom-UnixTime $_.RecordStartTime
            StartTime       = ConvertFrom-UnixTime $_.StartTime
            PlayURL         = $_.PlayURL
            CmdURL          = $_.CmdURL
        }
    }

    # Return the list of recordings
    $RecordingsPSObj
}
