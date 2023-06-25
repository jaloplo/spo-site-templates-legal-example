param(
    [Parameter(Mandatory=$true)]
    [System.String] $Title,
    [Parameter(Mandatory=$false)]
    [System.String] $Description,
    [Parameter(Mandatory=$true)]
    [ValidateSet("Communication Site", "Team Site", "Channel Site")]
    [System.String] $WebTemplate,
    [Parameter(Mandatory=$true)]
    $ScriptTitles,
    [Parameter(Mandatory=$false)]
    [System.String] $ThumbnailUrl,
    [Parameter(Mandatory=$false)]
    [System.String] $PreviewImageUrl,
    [Parameter(Mandatory=$false)]
    [System.String] $PreviewImageAltText,
    [Parameter(Mandatory=$false)]
    [Switch] $IsDefault
)

Write-Host ">>> Uploading site desing..." -ForegroundColor Cyan

# Writing input parameters in the console...
Write-Host "Parameters" -ForegroundColor DarkCyan
Write-Host "- Title: $Title" -ForegroundColor DarkCyan
Write-Host "- WebTemplate: $WebTemplate" -ForegroundColor DarkCyan
Write-Host "- ScriptTitles: $ScriptTitles" -ForegroundColor DarkCyan
If( $null -ne $Description -and "" -ne $Description ) {
    Write-Host "- Description: $Description" -ForegroundColor DarkCyan
}
If( $null -ne $ThumbnailUrl -and "" -ne $ThumbnailUrl ) {
    Write-Host "- ThumbnailUrl: $ThumbnailUrl" -ForegroundColor DarkCyan
}
If( $null -ne $PreviewImageUrl -and "" -ne $PreviewImageUrl ) {
    Write-Host "- PreviewImageUrl: $PreviewImageUrl" -ForegroundColor DarkCyan
}
If( $null -ne $PreviewImageAltText -and "" -ne $PreviewImageAltText ) {
    Write-Host "- PreviewImageAltText: $PreviewImageAltText" -ForegroundColor DarkCyan
}
If( $null -ne $IsDefault ) {
    Write-Host "- IsDefault: $IsDefault" -ForegroundColor DarkCyan
}

# Setting the corresponding value for the web template provided
$WebTemplateId = "68"
If( $WebTemplate -eq "Team Site") {
    $WebTemplateId = "64"
}
If( $WebTemplate -eq "Channel Site") {
    $WebTemplateId = "69"
}

# Getting the site scripts from the titles provided
$SiteScripts = Get-SPOSiteScript | Where-Object { $_.Title -in $ScriptTitles }


Try {
    # Obtaining the site design from the tenant if exists...
    Write-Host ">>> Checking if the site design already exists in the tenant..." -ForegroundColor Cyan
    $SiteDesign = Get-SPOSiteDesign | Where-Object { $_.Title -eq $Title } | Select-Object -First 1

    If( $null -eq $SiteDesign ) {
        Write-Host ">>> Creating the site design..." -ForegroundColor Cyan
        If($IsDefault) {
            $null = Add-SPOSiteDesign -Title $Title -WebTemplate $WebTemplateId -SiteScripts $SiteScripts -Description $Description -ThumbnailUrl $ThumbnailUrl -PreviewImageUrl $PreviewImageUrl -PreviewImageAltText $PreviewImageAltText -IsDefault:$true
        }
        Else {
            $null = Add-SPOSiteDesign -Title $Title -WebTemplate $WebTemplateId -SiteScripts $SiteScripts -Description $Description -ThumbnailUrl $ThumbnailUrl -PreviewImageUrl $PreviewImageUrl -PreviewImageAltText $PreviewImageAltText
        }
        Write-Host "Site design created." -ForegroundColor DarkCyan
    }
    Else {
        Write-Host ">>> Updating the site design..." -ForegroundColor Cyan
        IF($IsDefault) {
            $null = Set-SPOSiteDesign -Identity $($SiteDesign.Id)-Title $Title -WebTemplate $WebTemplateId -SiteScripts $SiteScripts -Description $Description -ThumbnailUrl $ThumbnailUrl -PreviewImageUrl $PreviewImageUrl -PreviewImageAltText $PreviewImageAltText -IsDefault:$true
        }
        Else {
            $null = Set-SPOSiteDesign -Identity $($SiteDesign.Id)-Title $Title -WebTemplate $WebTemplateId -SiteScripts $SiteScripts -Description $Description -ThumbnailUrl $ThumbnailUrl -PreviewImageUrl $PreviewImageUrl -PreviewImageAltText $PreviewImageAltText
        }
        Write-Host "Site design updated." -ForegroundColor DarkCyan
    }
}
Catch {
    Write-Host "An unknown error has occurred."
    Write-Host $_
}