param(
    [Parameter(Mandatory=$true)]
    [System.String] $JsonFile,
    [Parameter(Mandatory=$true)]
    [System.String] $Title,
    [Parameter(Mandatory=$false)]
    [System.String] $Description
)

Write-Host ">>> Uploading script..." -ForegroundColor Cyan

# Writing input parameters in the console...
Write-Host "Parameters" -ForegroundColor DarkCyan
Write-Host "- File: $JsonFile" -ForegroundColor DarkCyan
Write-Host "- Title: $Title" -ForegroundColor DarkCyan
If( $null -ne $Description -and "" -ne $Description ) {
    Write-Host "- Description: $Description" -ForegroundColor DarkCyan
}

# Checking if the file provided exists...
Write-Host ">>> Checking file..." -ForegroundColor Cyan
$DoesJsonFileExist = Test-Path -Path $JsonFile -PathType Leaf
If( $false -eq $DoesJsonFileExist ) {
    Write-Host "File $JsonFile doesn't exists" -ForegroundColor Red
    Exit
}
Write-Host "File can be accessed." -ForegroundColor DarkCyan

Try {
    # Reading file content...
    Write-Host ">>> Reading file content..." -ForegroundColor Cyan
    $FileContent = Get-Content $JsonFile -Raw
    Write-Host "File content read." -ForegroundColor DarkCyan

    # Obtaining the site script from the tenant if exists...
    Write-Host ">>> Checking if the script already exists in the tenant..." -ForegroundColor Cyan
    $SiteScript = Get-SPOSiteScript | Where-Object { $_.Title -eq $Title } | Select-Object -First 1

    # Based on the existence of the site script, it is created or updated.
    If( $null -eq $SiteScript ) {
        Write-Host ">>> Creating the site script..." -ForegroundColor Cyan
        $null = Add-SPOSiteScript -Title $Title -Description $Description -Content $FileContent
        Write-Host "Site script created." -ForegroundColor DarkCyan
    }
    Else {
        Write-Host ">>> Updating the site script..." -ForegroundColor Cyan
        $null = Set-SPOSiteScript -Identity $($SiteScript.Id) -Content $FileContent -Version $($SiteScript.Version + 1)
        Write-Host "Site script updated with version $($SiteScript.Version + 1)." -ForegroundColor DarkCyan
    }
}
Catch {
    Write-Host "An unknown error has occurred."
    Write-Host $_
}