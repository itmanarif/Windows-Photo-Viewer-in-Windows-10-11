# Ensure admin rights
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(
    [Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "`nPlease run this script as Administrator."
    exit
}

Write-Host "`nUninstalling Microsoft Photos app..."

# Remove the default Photos app
Get-AppxPackage *Microsoft.Windows.Photos* | Remove-AppxPackage

Write-Host "`nEnabling Windows Photo Viewer and setting as default image viewer..."

$regContent = @"
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations]
".bmp"="PhotoViewer.FileAssoc.Tiff"
".dib"="PhotoViewer.FileAssoc.Tiff"
".jpg"="PhotoViewer.FileAssoc.Tiff"
".jpeg"="PhotoViewer.FileAssoc.Tiff"
".jpe"="PhotoViewer.FileAssoc.Tiff"
".png"="PhotoViewer.FileAssoc.Tiff"
".gif"="PhotoViewer.FileAssoc.Tiff"
".tif"="PhotoViewer.FileAssoc.Tiff"
".tiff"="PhotoViewer.FileAssoc.Tiff"
"@

$tempRegPath = "$env:TEMP\EnablePhotoViewer.reg"
$regContent | Out-File -Encoding ASCII -FilePath $tempRegPath

Start-Process "regedit.exe" -ArgumentList "/s `"$tempRegPath`"" -Wait
Remove-Item $tempRegPath -Force

$assocTypes = @("jpg", "jpeg", "png", "bmp", "gif")
foreach ($ext in $assocTypes) {
    cmd /c "assoc .$ext=PhotoViewer.FileAssoc.Tiff" | Out-Null
}

Write-Host "`nWindows Photo Viewer has been enabled and set as default for images."
Write-Host "`nReady for next command..."
