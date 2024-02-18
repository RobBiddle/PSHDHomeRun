# Get public and private function definition files.
$Public = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue )

# Dot Source Function Files
@($Public + $Private) | ForEach-Object {
    $FileToImport = $_
    Try {
        .$FileToImport.FullName
    }
    Catch {
        Write-Error -Message "Failed to import: $($FileToImport.FullName): $_"
    }
}

# Load PSHDHomeRunSettings.json into a Global Variable
$Global:PSHDHomeRunSettings = Get-PSHDHomeRunSetting
Export-ModuleMember -Function $Public.Basename -Cmdlet $Public.Basename -Variable $Global:PSHDHomeRunSettings
