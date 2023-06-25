# Set the variable values of the site template
$Title = "Standard Legal Folder Structure for Team Sites"
$Description = "Create the standard folder structure for team sites."
$SiteScriptTitles = @(
    "Legal cases folder structure",
    "Legal documents folder structure",
    "Legal resources folder structure"
)

# Add the site design to the catalog and, also, add it as the default template when creating Microsoft Teams
.\lib\Upload-TeamSiteSiteDesign.ps1 -Title $Title -Description $Description -ScriptTitles $SiteScriptTitles -IsDefault