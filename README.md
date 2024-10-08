# PSHDHomeRun Module

## Description

PSHDHomeRun is a PowerShell module that provides a set of cmdlets for interacting with HDHomeRun devices and recordings.
A JSON file [PSHDHomeRunSettings.json](/PSHDHomeRunSettings.json) is used to manage settings for the module.
This enables you to easily delete recordings from the HDHomeRun device based on the settings in the JSON file.
You can use different settings for different TV series, movies, or sports events based on the Title.

# Installation
```powershell
Install-Module -Name PSHDHomeRun
```

![](https://gist.githubusercontent.com/RobBiddle/47d86620051190b77f0b0df14503a732/raw/7c85562daa123afb86a5c9ff8cdccd6a0e53c00e/PSHDHomeRun_Demo.svg)

## PSHDHomeRun Cmdlets

### [Get-HDHomeRunRecording](/help/Get-HDHomeRunRecording.md)

Gets the recordings from the HDHomeRun device.

### [Get-PSHDHomeRunSetting](/help/Get-PSHDHomeRunSetting.md)

Gets the settings from PSHDHomeRunSettings.json which is used to store the settings for the module.

### [Invoke-PSHDHomeRunCleanup](/help/Invoke-PSHDHomeRunCleanup.md)

Cleans up the recordings from the HDHomeRun device based on the settings in PSHDHomeRunSettings.json.

### [Remove-HDHomeRunRecording](/help/Remove-HDHomeRunRecording.md)

Deletes recordings from the HDHomeRun device.

### [Save-HDHomeRunRecording](/help/Save-HDHomeRunRecording.md)

Saves recordings from the HDHomeRun device to a specified location.
