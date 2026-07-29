param(
    [string]$RepositoryPath = "C:\Users\jneik\Documents\GitHub\bneikens.github.io"
)

$ErrorActionPreference = "Stop"
$SourcePath = Join-Path $PSScriptRoot "SITE_FILES"

if (-not (Test-Path $RepositoryPath)) {
    throw "Repository path not found: $RepositoryPath"
}

if (-not (Test-Path $SourcePath)) {
    throw "SITE_FILES folder not found beside this script."
}

$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$backupPath = Join-Path (Split-Path $RepositoryPath -Parent) "bneikens.github.io-backup-$timestamp"

Write-Host "Creating backup at $backupPath ..."
robocopy $RepositoryPath $backupPath /E /XD .git _site .jekyll-cache /R:1 /W:1 | Out-Host
if ($LASTEXITCODE -gt 7) {
    throw "Backup failed with Robocopy exit code $LASTEXITCODE."
}

$obsoleteFiles = @(
    "_posts\2014-07-13-project-6.markdown",
    "_posts\2014-07-14-project-5.markdown",
    "_posts\2014-07-15-project-4.markdown",
    "_posts\2014-07-16-project-3.markdown",
    "_posts\2014-07-17-project-2.markdown",
    "_posts\2014-07-18-project-1.markdown",
    "_includes\clients.html",
    "_includes\modals.html",
    "js\contact_me.js",
    "js\jqBootstrapValidation.js",
    "mail\contact_me.php",
    "img\team\3.JPG"
)

foreach ($relativePath in $obsoleteFiles) {
    $target = Join-Path $RepositoryPath $relativePath
    if (Test-Path $target) {
        Remove-Item $target -Force
        Write-Host "Removed $relativePath"
    }
}

$obsoleteFolders = @(
    "img\portfolio",
    "img\logos"
)

foreach ($relativePath in $obsoleteFolders) {
    $target = Join-Path $RepositoryPath $relativePath
    if (Test-Path $target) {
        Remove-Item $target -Recurse -Force
        Write-Host "Removed $relativePath"
    }
}

Write-Host "Copying refreshed website files ..."
robocopy $SourcePath $RepositoryPath /E /R:1 /W:1 | Out-Host
if ($LASTEXITCODE -gt 7) {
    throw "Website copy failed with Robocopy exit code $LASTEXITCODE."
}

Write-Host ""
Write-Host "Website refresh applied successfully." -ForegroundColor Green
Write-Host "Backup: $backupPath"
Write-Host "Next: review changes in VS Code, verify _config.yml, commit, and push the website-refresh branch."
