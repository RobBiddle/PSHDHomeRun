#
# Module manifest for module 'PSHDHomeRun'
#
# Generated by: Robert D. Biddle
#
# Generated on: 2024-01-24
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'PSHDHomeRun.psm1'

# Version number of this module.
ModuleVersion = '1.0.3'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = 'd627df57-d2d6-46f7-b41b-69e22a108604'

# Author of this module
Author = 'Robert D. Biddle'

# Company or vendor of this module
# CompanyName = 'Unknown'

# Copyright statement for this module
Copyright = '(c) 2024 Robert D. Biddle. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Manage SiliconDust HDHomeRun network TV tuner/DVR using PowerShell and JSON'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '3.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = ''

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @('Get-PSHDHomeRunSetting', 'Get-HDHomeRunRecording', 'Invoke-PSHDHomeRunCleanup','Remove-HDHomeRunRecording','Save-HDHomeRunRecording')

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @('Get-PSHDHomeRunSetting', 'Get-HDHomeRunRecording', 'Invoke-PSHDHomeRunCleanup','Remove-HDHomeRunRecording','Save-HDHomeRunRecording')

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
FileList = @('PSHDHomeRun.psd1','PSHDHomeRun.psm1','PSHDHomeRunSettings.json','Public\Get-PSHDHomeRunSetting.ps1','Public\Get-HDHomeRunRecording.ps1','Public\Invoke-PSHDHomeRunCleanup.ps1','Public\Remove-HDHomeRunRecording.ps1','Public\Save-HDHomeRunRecording.ps1')

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('HDHomeRun','DVR','JSON','PowerShell','PSHDHomeRun','SiliconDust', 'TV', 'Recordings', 'Movies', 'HomeTheater')

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/RobBiddle/PSHDHomeRun/blob/main/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/RobBiddle/PSHDHomeRun'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        # ReleaseNotes = ''

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
HelpInfoURI = 'https://github.com/RobBiddle/PSHDHomeRun/help/PSHDHomeRun-help.xml'

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

