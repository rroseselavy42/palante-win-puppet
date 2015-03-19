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
        notify          => Exec['changeaclscan'],
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
    command     => 'cmd.exe %SOFTWARE%\microsoftsecurityessentials\SetACL.exe -on "HKLM\Software\Microsoft\Microsoft Antimalware\Scan" -ot reg -actn ace -ace "n:Administrators;p:full"',
    refreshonly => true,
    path        =>  $::path,
    notify      => Exec['changeaclpaths'],
  }
  exec { 'changeaclpaths':
    command     => 'cmd.exe %SOFTWARE%\microsoftsecurityessentials\SetACL.exe -on "HKLM\Software\Microsoft\Microsoft Antimalware\Exclusions\Paths" -ot reg -actn ace -ace "n:Administrators;p:full"',
    refreshonly => true,
    path        =>  $::path,
    notify      => Exec['ScheduleDay']
  }
  exec { 'ScheduleDay':
    command     => 'cmd.exe /C REG ADD "HKLM\Software\Microsoft\Microsoft Antimalware\Scan" /v ScheduleDay /t REG_DWORD /d 0x00000000 /f',
    refreshonly => true,
    path        =>  $::path,
    notify      => Exec['ScheduleTime']
  }
  exec { 'ScheduleTime':
    command     => 'cmd.exe /C REG ADD "HKLM\Software\Microsoft\Microsoft Antimalware\Scan" /v ScheduleTime /t REG_DWORD /d 0x000003c0 /f',
    refreshonly => true,
    path        =>  $::path,
    notify      => Exec['excludevnc']
  }
  exec { 'excludevnc':
    command     => 'cmd.exe /C REG ADD "HKLM\Software\Microsoft\Microsoft Antimalware\Exclusions\Paths" /v "C:\Program Files\uvnc bvba\UltraVNC\winvnc.exe" /t REG_DWORD /d 0x00000000  /f',
    refreshonly => true,
    path        =>  $::path,
    notify      => Exec['restoreaclscan']
  }
  exec { 'restoreaclscan':
    command     => 'cmd.exe %SOFTWARE%\microsoftsecurityessentials\SetACL.exe -on "hklm\software\Microsoft\Microsoft Antimalware\Scan" -ot reg -actn ace -ace "n:Administrators;p:read"',
    refreshonly => true,
    path        =>  $::path,
    notify      => Exec['restoreaclpaths'],
  }
  exec { 'restoreaclpaths':
    command     => 'cmd.exe %SOFTWARE%\microsoftsecurityessentials\SetACL.exe -on "hklm\software\Microsoft\Microsoft Antimalware\Exclusions\Paths" -ot reg -actn ace -ace "n:Administrators;p:read"',
    refreshonly => true,
    path        =>  $::path,

  }
}


#change registry to daily scan
  #not working due to MSE registry protection!
  #porting wpkg package for now
/* registry::value {'dailyscan':
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
    require => Exec['changeaclscan'],

    }
    #turn off only if idle
  registry::value {'onlyidle':
    key     => 'HKLM\Software\Microsoft\Microsoft Antimalware\Scan',
    value   => ScanOnlyIfIdle,
    type    => dword,
    data    => '0x00000000',
    require => Exec['changeaclpaths'],


    }

  */