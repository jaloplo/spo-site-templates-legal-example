param(
    [Parameter(Mandatory=$true)]
    [System.String] $DataFile
)

Write-Host ">>> Uploading script from file..." -ForegroundColor Cyan

# Writing input parameters in the console...
Write-Host "Parameters" -ForegroundColor DarkCyan
Write-Host "- DataFile: $DataFile" -ForegroundColor DarkCyan

# Checking if the file provided exists...
Write-Host ">>> Checking file..." -ForegroundColor Cyan
$DoesDataFileExist = Test-Path -Path $DataFile -PathType Leaf
If( $false -eq $DoesDataFileExist ) {
    Write-Host "File $DataFile doesn't exists" -ForegroundColor Red
    Exit
}
Write-Host "File can be accessed." -ForegroundColor DarkCyan

Try {
    # Reading file content...
    Write-Host ">>> Reading data file content..." -ForegroundColor Cyan
    $DataFileContent = Get-Content $DataFile -Raw | ConvertFrom-Json
    Write-Host "Data file content read." -ForegroundColor DarkCyan

    $DataFileContent | Foreach-Object {
        .\lib\Upload-SiteScript.ps1 -Title $_.title -Description $_.description -JsonFile $_.file
    }
}
Catch {
    Write-Host "An unknown error has occurred."
    Write-Host $_
}