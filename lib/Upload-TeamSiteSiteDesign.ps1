param(
    [Parameter(Mandatory=$true)]
    [System.String] $Title,
    [Parameter(Mandatory=$false)]
    [System.String] $Description,
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

.\lib\Upload-SiteDesign.ps1 -Title $Title -Description $Description -WebTemplate 'Team Site' -ScriptTitles $ScriptTitles -ThumbnailUrl $ThumbnailUrl -PreviewImageUrl $PreviewImageUrl -PreviewImageAltText $PreviewImageAltText -IsDefault:$IsDefault