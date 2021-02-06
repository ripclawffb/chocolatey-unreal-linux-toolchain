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

$url        = 'https://cdn.unrealengine.com/CrossToolchain_Linux/v16_clang-9.0.1-centos7.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Unreal Linux Toolchain*'

  checksum      = 'faffaabbbc5de462284335ed4ea461e1305ae955a7cba285da0b38645c421d1b'
  checksumType  = 'sha256'

  silentArgs = $silentArgs
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
