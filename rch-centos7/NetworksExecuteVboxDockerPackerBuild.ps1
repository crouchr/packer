﻿# Richard Crouch modified script to use for VirtualBox builds
# Added $BoxVersion and $BoxDescription as calling parameters as well as generation of metaadata.json
# This script is called from Jenkins
# This script is NOT identical to the NVM one, but is similar
# This has been copied from NetworksExecuteVboxPackerBuild.ps1 - parameterise them and merge them at some point
# Mainly adding 'docker' to various files etc.

param (
  [Parameter(Mandatory)]
  $PackerBuilder,
  [Parameter(Mandatory)]
  $PackerTemplate,
  [Parameter(Mandatory)]
  $VarsFiles
)

# Exit on first error
$ErrorActionPreference = "Stop"

Write-Host "Running NetworksExecuteVboxDockerPackerBuild.ps1 script..."
Write-Host "Parameters:"
Write-Host "  PackerBuilder  : $PackerBuilder"
Write-Host "  PackerTemplate : $PackerTemplate"
Write-Host "  VarsFiles      : $VarsFiles"

################################################################
$BoxFile = "rch-centos7-docker-v$Env:BOX_VERSION.box"
$BoxUrl="https://richardcrouch.s3-eu-west-1.amazonaws.com/boxes/rch-centos7-docker/$BoxFile"
$PackerBinary = "/usr/local/bin/packer"
################################################################

& $PackerBinary version
$PSversion = $PSVersionTable.PSVersion.Major
Write-Host "PowerShell version : $PSversion"

$Env:PACKER_LOG = "1"
Write-Host "PACKER_LOG : $Env:PACKER_LOG"

$WorkingDir = [string](Get-Location)
$Env:PACKER_LOG_PATH =  $WorkingDir + "\" +"$PackerBuilder.log"

Write-Host "WorkingDir is $WorkingDir"
Write-Host "PACKER_LOG_PATH : $Env:PACKER_LOG_PATH"
Write-Host "Env: BOX_VERSION                : $Env:BOX_VERSION"
Write-Host "Env: BOX_DESCRIPTION            : $Env:BOX_DESCRIPTION"
Write-Host "Env: Jenkins JOB_NAME           : $Env:JOB_NAME"
Write-Host "Env: Jenkins BUILD_DISPLAY_NAME : $Env:BUILD_DISPLAY_NAME"
Write-Host "Env: NOTES : $Env:NOTES"

# Read ISO filename from vars file to add to metadata.json
$Json = Get-Content 'stack_vars/rch-centos7-docker-vars.json' | Out-String | ConvertFrom-Json
$IsoFilename = $Json.iso_filename

#[string]$BuildDate = Get-Date -Format "dddd dd/MM/yyyy HH:mm K"
# ISO 8601 format
[string]$BuildDate = [DateTime]::UtcNow | get-date -Format "yyyy-MM-ddTHH:mm:ss.000Z"

[string]$BoxDescription = $Env:BOX_DESCRIPTION +`
", PackerBuilder=" + $PackerBuilder + `
", PackerTemplate=" + $PackerTemplate + `
", ISO=" + $IsoFilename + `
", build started " + $BuildDate + `
" on Node " + $Env:NODE_NAME + `
", Jenkins Job=" + $Env:JOB_NAME + `
", Jenkins Build=" + $Env:BUILD_DISPLAY_NAME + `
", NOTES=[$Env:NOTES]"

Write-Host "BoxDescription : $BoxDescription"

# Create BOX_README.md to be copied into /home/vagrant by the provisioner
$BoxReadMeFilename="BOX_README.md"
Write-Host "Creating $BoxReadMeFilename"
$BoxReadMe = "Description `n" + `
"=========== `n" + `
"This README was created automatically as part of the Packer build for this machine. `n" + `
$BoxDescription + "`n"
Write-Host "BoxReadMe :"
$BoxReadMe
$BoxReadMe | out-file -filepath $BoxReadMeFilename -Encoding Ascii -Force

$BoxVarsFile = Get-Content 'box-vars-template.json' -Raw
$BoxVarsFile = $BoxVarsFile.Replace("<box_version>",$Env:BOX_VERSION)
$BoxVarsFile = $BoxVarsFile.Replace("<box_description>",$BoxDescription)
$BoxVarsFile | out-file -filepath 'box-vars.json' -Encoding Ascii -Force
Write-Host "Populated box-vars.json to be passed to Packer is :"
Get-Content 'box-vars.json'

$validateargs = @('validate')

#packer build -var 'app_name_cmd_var=apache' apache.json
$args = @('build')
$args += "--only=$PackerBuilder"
$args += "--force"
$args += "-var-file=box-vars.json"  # pass the box version and description via var-file

$VarFiles = $VarsFiles -split ';'
foreach ($VarFile in $VarFiles){
    $args += "-var-file=$VarFile"
    $validateargs += "-var-file=$VarFile"
}

$args += $PackerTemplate
$validateargs += $PackerTemplate

# Step 0 : Run Packer in validation mode...
Write-Host "Validating the Packer template with the following arguments :"
Write-Host $validateargs
& $PackerBinary $validateargs

# Step 1 : Run Packer...
Write-Host "Running $PackerBinary with the following arguments :"
Write-Host $args
& $PackerBinary $args
$PackerExitCode = $LastExitCode
Write-Host "ExitCode from Packer Build : $PackerExitCode"

# Step 2 : Generate VirtualBox metadata.json file containing the version information
$TemplateFile = 'box-metadata-template.json'

$BoxChecksum = Get-FileHash -Path $BoxFile -Algorithm "SHA1"
$BoxChecksum = $BoxChecksum.Hash

$MetadataFile = Get-Content $TemplateFile -Raw
$MetadataFile=$MetadataFile.Replace("<version>",$Env:BOX_VERSION)
$MetadataFile=$MetadataFile.Replace("<checksum>",$BoxChecksum)
$MetadataFile=$MetadataFile.Replace("<description>",$BoxDescription)
$MetadataFile=$MetadataFile.Replace("<box_url>",$BoxUrl)
# Not working
#$MetadataFile=$MetadataFile.Replace("<creation_date>",$BuildDate)

# Dump metadata json file to console
$MetadataFilename = "rch-centos7-docker-metadata.json"
Write-Host "VBox-format $MetadataFilename file contesnts :"
$MetadataFile

# Save to file so can be sent to S3 and collected as an artifact
$MetadataFile | out-file -filepath $MetadataFilename -Encoding Ascii -Force

# If the Packer Build failed then fail the job
exit $PackerExitCode
