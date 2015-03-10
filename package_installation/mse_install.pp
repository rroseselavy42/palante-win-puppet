# Class: mse install
# installs microsoft security essentials
# makes it scan daily. 
class mse_install {
    # install mse
    $installsource = hiera('install:source')
    $mseversion = hiera('mse:version')
  if $::architecture == 'x86' {
    package { 'Microsoft Security Essentials':
        ensure          => present,
        source          => "${installsource}/microsoftsecurityessentials/mseinstall.exe",
        install_options => ['/s', '/o', '/runwgacheck'],
    }}
  else {
    package { 'Microsoft Security Essentials':
        ensure          => $mseversion,
        source          => "${installsource}/microsoftsecurityessentials/mseinstall_64.exe",
        install_options => ['/s', '/o', '/runwgacheck'],
        notify          => Exec['changeaclscan'],
    }
  }
  exec { 'changeaclscan':
    command     => '%SOFTWARE%\microsoftsecurityessentials\SetACL.exe -on "hklm\software\Microsoft\Microsoft Antimalware\Scan" -ot reg -actn ace -ace "n:Administrators;p:full"',
    refreshonly => true,
    path        =>  $::path,
    notify      => Exec['changeaclpaths'],
  }
  exec { 'changeaclpaths':
    command     => '%SOFTWARE%\microsoftsecurityessentials\SetACL.exe -on "hklm\software\Microsoft\Microsoft Antimalware\Exclusions\Paths" -ot reg -actn ace -ace "n:Administrators;p:full"',
    refreshonly => true,
    path        =>  $::path,
  }
  #change registry to daily scan
  registry::value {'dailyscan':
    key     => 'HKLM\Software\Microsoft\Microsoft Antimalware\Scan',
    value   => ScheduleDay,
    type    => dword,
    data    => '0x00000000',
    require => Exec['changeaclscan'],
    }
  #set time for daily scan
  registry::value {'scantime':
    key     => 'HKLM\Software\Microsoft\Microsoft Antimalware\Scan',
    value   => ScheduleTime,
    type    => dword,
    data    => '0x000003c0',
    require => Exec['changeaclpaths'],

    }
    #turn off only if idle
  registry::value {'onlyidle':
    key     => 'HKLM\Software\Microsoft\Microsoft Antimalware\Scan',
    value   => ScanOnlyIfIdle,
    type    => dword,
    data    => '0x00000000',
    require => Package['Microsoft Security Essentials'],

    }
  #exclude ultravnc
  registry::value {'except_ultravnc':
    key     => 'HKLM\Software\Microsoft\Microsoft Antimalware\Exclusions\Paths',
    value   => 'C:\Program Files\uvnc bvba\UltraVNC\winvnc.exe',
    type    => dword,
    data    => '0x00000000',
    require => Package['Microsoft Security Essentials'],
    notify  => Exec['restoreaclscan'],

    }
  exec { 'restoreaclscan':
    command     => '%SOFTWARE%\microsoftsecurityessentials\SetACL.exe -on "hklm\software\Microsoft\Microsoft Antimalware\Scan" -ot reg -actn ace -ace "n:Administrators;p:read"',
    refreshonly => true,
    path        =>  $::path,
    notify      => Exec['restoreaclpaths'],
  }
  exec { 'restoreaclpaths':
    command     => '%SOFTWARE%\microsoftsecurityessentials\SetACL.exe -on "hklm\software\Microsoft\Microsoft Antimalware\Exclusions\Paths" -ot reg -actn ace -ace "n:Administrators;p:read"',
    refreshonly => true,
    path        =>  $::path,

  }
}