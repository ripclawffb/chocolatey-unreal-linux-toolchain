$ErrorActionPreference = 'Stop';

$additionalArgs = ''
$packageParameters = Get-PackageParameters

if ($packageParameters['directory']) { $directory = $packageParameters['directory'] }

if(Get-Variable -Name directory -ErrorAction SilentlyContinue) {
  $additionalArgs = "/D=$directory"
}

if($packageParameters.keys.count -gt 0) {
  $silentArgs   = "/S $additionalArgs"
} else {
  $silentArgs   = '/S'
}

$url        = 'https://cdn.unrealengine.com/CrossToolchain_Linux/v15_clang-8.0.1-centos7.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Unreal Linux Toolchain*'

  checksum      = '51fe9803bcfc99901be058ca21fabdafb67f11e15a0bda6866847d91d77110cf'
  checksumType  = 'sha256'

  silentArgs = $silentArgs
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
