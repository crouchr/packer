#!/usr/bin/env bash -eux
# Network Team PowerShell script for running the packer job locally on your laptop (e.g. not in Jenkins)
# Note : You must be connected Office LAN or via VPN to run this to access spacewalk
# Note : You need to have PowerShell installed on your Windows/Linux/MacBook
# THIS IS DERIVED FROM THE NVM SCRIPT AND IS USED FOR TESTING BUILDING HPOT
# i.e. aws_profile is not needed in this version compared to NVM one

# These environmental variables would be set by Jenkins etc so fake them up here
$Env:BOX_VERSION = '1.0.0-local'
$Env:BOX_DESCRIPTION = "A CentOS7 box image primarily for use in Hpot Chef test-kitchen"
$Env:JOB_NAME = "Simulated Jenkins Job Name"
$Env:BUILD_DISPLAY_NAME = "Simulated Jenkins Build Display Name"
$Env:NODE_NAME = "LOCAL_BUILD"

Write-Host
Write-Host "Building box with following version : $Env:BOX_VERSION"
Write-Host "Box has the following description   : $Env:BOX_DESCRIPTION"
Write-Host "Env:JOB_NAME                        : $Env:JOB_NAME"
Write-Host "Env:BUILD_DISPLAY_NAME              : $Env:BUILD_DISPLAY_NAME"
Write-Host "Env:NODE_NAME                       : $Env:NODE_NAME"

# PowerShell treats the cwd as the directory in which PowerShell itself is found
# So change directory to the 'current' directory like any proper OS and continue...
Set-Location -Path $PSScriptRoot
& .\NetworksExecuteHpotPackerBuild.ps1 `
  -PackerBuilder "CentOS7_HPOT" `
  -PackerTemplate "rch-hpot-packer.json" `
  -VarsFiles "stack_vars/rch-hpot-vars.json"
