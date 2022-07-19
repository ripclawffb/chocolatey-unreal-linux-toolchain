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

$url        = 'https://cdn.unrealengine.com/CrossToolchain_Linux/v20_clang-13.0.1-centos7.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Unreal Linux Toolchain*'

  checksum      = '91a8f2c28960d2e273ce0ca20b32f39e0c75205dbfab1d952bdf022ae06317ed'
  checksumType  = 'sha256'

  silentArgs = $silentArgs
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
