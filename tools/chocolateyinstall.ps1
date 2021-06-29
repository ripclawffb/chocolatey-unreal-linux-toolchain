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

$url        = 'https://cdn.unrealengine.com/CrossToolchain_Linux/v18_clang-11.0.1-centos7.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Unreal Linux Toolchain*'

  checksum      = '16a125f0e628218b484b6cd4a5c622e61bd521908b3ac99a7546e9eaaea3c7ea'
  checksumType  = 'sha256'

  silentArgs = $silentArgs
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
