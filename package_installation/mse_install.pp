# Class: mse install
# installs microsoft security essentials
# makes it scan daily. 
class mse_install {
    # install mse
    $installsource = hiera('install:source')
    $mseversion = hiera('mse:version')
  if $::architecture == 'x86' {
    package { 'Microsoft Security Essentials':
        ensure          => $mseversion,
        source          => "${installsource}/microsoftsecurityessentials/mseinstall.exe",
        install_options => ['/s', '/o', '/runwgacheck'],
    }}
  else {
    package { 'Microsoft Security Essentials':
        ensure          => $mseversion,
        source          => "${installsource}/microsoftsecurityessentials/mseinstall_64.exe",
        install_options => ['/s', '/o', '/runwgacheck'],
    }
  }
  #change registry to daily scan
  registry::value {'dailyscan':
    key   => 'HKLM\Software\Microsoft\Microsoft Antimalware\Scan',
    value => ScheduleDay,
    type  => dword,
    data  => '0x00000000',
    }
  #set time for daily scan
  registry::value {'scantime':
    key   => 'HKLM\Software\Microsoft\Microsoft Antimalware\Scan',
    value => ScheduleTime,
    type  => dword,
    data  => '0x000003c0',
    }
    #turn off only if idle
  registry::value {'onlyidle':
    key   => 'HKLM\Software\Microsoft\Microsoft Antimalware\Scan',
    value => ScanOnlyIfIdle,
    type  => dword,
    data  => '0x00000000',
    }
  #exclude ultravnc
  registry::value {'except_ultravnc':
    key   => 'HKLM\Software\Microsoft\Microsoft Antimalware\Exclusions\Paths',
    value => 'C:\Program Files\uvnc bvba\UltraVNC\winvnc.exe',
    type  => dword,
    data  => '0x00000000',
    }
}