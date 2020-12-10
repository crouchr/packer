# Use this is the Jenkins build job is failing

# Fake the build parameters that Jenkins would ask for
$Env:BOX_VERSION = '1.0.0-local'
$Env:BOX_DESCRIPTION = "This box built by fake_jenkins_build.sh"
$Env:JOB_NAME = "Simulated Jenkins Job Name"
$Env:BUILD_DISPLAY_NAME = "Simulated Jenkins Build Name"
$Env:NODE_NAME = "LOCAL_BUILD"

Set-Location -Path $PSScriptRoot
& .\NetworksExecuteVboxPackerBuild.ps1 `
 -PackerBuilder "RCH_CentOS7_VIRTUALBOX" `
 -PackerTemplate "rch-centos7-packer.json" `
 -VarsFiles "account_vars/junk_aws_vars.json;stack_vars/rch-centos7-vars.json"
