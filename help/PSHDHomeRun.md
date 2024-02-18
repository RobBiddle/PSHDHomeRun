---
Module Name: PSHDHomeRun
Module Guid: d627df57-d2d6-46f7-b41b-69e22a108604
Download Help Link: {{ Update Download Link }}
Help Version: {{ Please enter version of help manually (X.X.X.X) format }}
Locale: en-US
---

# PSHDHomeRun Module

## Description

PSHDHomeRun is a PowerShell module that provides a set of cmdlets for interacting with HDHomeRun devices and recordings.
A JSON file is used to manage settings for the module.
This enables you to easily delete recordings from the HDHomeRun device based on the settings in the JSON file.
You can use different settings for different TV series, movies, or sports events based on the Title.

## PSHDHomeRun Cmdlets

### [Get-HDHomeRunRecording](Get-HDHomeRunRecording.md)

Gets the recordings from the HDHomeRun device.

### [Get-PSHDHomeRunSetting](Get-PSHDHomeRunSetting.md)

Gets the settings from PSHDHomeRunSettings.json which is used to store the settings for the module.

### [Invoke-PSHDHomeRunCleanup](Invoke-PSHDHomeRunCleanup.md)

Cleans up the recordings from the HDHomeRun device based on the settings in PSHDHomeRunSettings.json.

### [Remove-HDHomeRunRecording](Remove-HDHomeRunRecording.md)

Deletes recordings from the HDHomeRun device.

### [Save-HDHomeRunRecording](Save-HDHomeRunRecording.md)

Saves recordings from the HDHomeRun device to a specified location.
