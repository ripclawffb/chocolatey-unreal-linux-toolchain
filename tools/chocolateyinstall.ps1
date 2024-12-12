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

$url        = 'https://cdn.unrealengine.com/CrossToolchain_Linux/v23_clang-18.1.0-rockylinux8.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Unreal Linux Toolchain*'

  checksum      = '5818d77761b2a88a52d1b58ecb2c36ffd6cf69bbf15f87c19e286cbf18579245'
  checksumType  = 'sha256'

  silentArgs = $silentArgs
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
