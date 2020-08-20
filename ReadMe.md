# Unreal Linux Toolchain Chocolatey Package

[![Build status](https://ci.appveyor.com/api/projects/status/lwhw7s9t4p9q26ik/branch/master?svg=true)](https://ci.appveyor.com/project/ripclawffb/chocolatey-unreal-linux-toolchain/branch/master)

Cross-compiling makes it possible for game developers to target Linux from Windows. At this time, cross-compiling is only supported for Windows, and Mac users currently have to resort to native compiling . Additionally, we support, test, and provide libraries and toolchains for the Linux-x86_64 platform.

**Please Note**: This is an automatically updated package. If you find it is
out of date by more than a day or two, please contact the maintainer(s) and
let them know the package is no longer updating correctly.

## Package Specific

### Package Parameters

The following package parameters can be set:

* directory <directory> - Custom installation path

To pass parameters, use `--params "''"` (e.g. `choco install packageID [other options] --params="'/ITEM:value /ITEM2:value2 /FLAG_BOOLEAN'"`).

To have choco remember parameters on upgrade, be sure to set `choco feature enable -n=useRememberedArgumentsForUpgrades`.
