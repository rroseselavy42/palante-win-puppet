class ultravnc_install {
  $installsource = hiera('install:source')
  $ultravncversion = hiera('ultravnc:version')

  if $::architecture == 'x86' {
    package {"UltraVnc":
      ensure          => $ultravncversion,
      #it would be great if 
      #I could convert . to _ for this
      #I will deal with it later YOLO 
      source          => "${installsource}/ultravnc/UltraVnc_1205_x86.msi",
      install_options => [ '/qn', '/norestart', {'SERVICE' => '1'}, {'CAD' => '1'}, {'SERVER' => '1'} ],
      notify          => Exec['addons'],
  }
      exec { 'addons':
        command     => 'cmd.exe %SOFTWARE%\ultravnc\UltraVNC_1_1_9_X86_Addons.exe /verysilent /loadinf="%SOFTWARE%\ultravnc\addons.inf"',
        refreshonly => true,
        notify      => Exec['certinstall'],
        path        => $::path,
      }

  
      exec { 'certinstall':
        command     => 'cmd.exe /c %SOFTWARE%\ultravnc\CertMgr.Exe -add %SOFTWARE%\ultravnc\ultravnc_x86.cer -s -r localMachine trustedpublisher',
        refreshonly => true,
        path        =>  $::path,
        notify      => Exec['mirrordriver'],
      }
        exec { 'mirrordriver':
    command     => 'cmd.exe "%SOFTWARE%\ultravnc\devcon_x86.exe" update "C:\Program Files\uvnc bvba\UltraVNC\driver\driver\mv2.inf" mv_hook_display_driver2',
    refreshonly => true,
    path        => $::path,
    notify      => Exec['setupdrv'],
  }
  
    }
  else {
    package {'UltraVnc':
      ensure          => $ultravncversion,
      #it would be great if 
      #I could convert . to _ for this
      #I will deal with it later YOLO 
      source          => "${installsource}/ultravnc/UltraVnc_1205_X64.msi",
      install_options => [ '/qn', '/norestart', {'SERVICE' => '1'}, {'CAD' => '1'}, {'SERVER' => '1'} ],
      notify          => Exec['addons'],
  }
      exec { 'addons':
        command     => 'cmd.exe %SOFTWARE%\ultravnc\UltraVNC_1_1_9_X64_Addons.exe /verysilent /loadinf="%SOFTWARE%\ultravnc\addons.inf"',
        refreshonly => true,
        notify      => Exec['certinstall'],
        path        => $::path,
      }

  
      exec { 'certinstall':
        command      => 'cmd.exe  %SOFTWARE%\ultravnc\CertMgr.Exe -add %SOFTWARE%\ultravnc\ultravnc_x64.cer -s -r localMachine trustedpublisher',
        refreshonly => true,
        path =>  $::path,
        notify => Exec['mirrordriver'],
      }
        exec { 'mirrordriver':
    command      => 'cmd.exe "%SOFTWARE%\ultravnc\devcon_x64.exe" update "C:\Program Files\uvnc bvba\UltraVNC\driver\driver\mv2.inf" mv_hook_display_driver2',
    refreshonly => true,
    path => $::path,
    notify     => Exec['setupdrv'],
  }
  }
  exec { 'setupdrv':
    command      => 'cmd.exe "%PROGRAMFILESDIR%\uvnc bvba\UltraVNC\driver\setupdrv.exe" installs',
    refreshonly => true,
    path => $::path,
    notify =>  Service['uvnc_service'],
  }
  service { 'uvnc_service':
    enable      => true,
    ensure      => running,
    notify      => Exec['softwarecad'],
    require     => Package['UltraVnc'],
  }
  exec { 'softwarecad':
    command      => 'cmd.exe "%PROGRAMFILESDIR%\uvnc bvba\UltraVNC\winvnc.exe" -softwarecad',
    refreshonly => true,
    path => $::path,
    notify => Exec['firewall5800'],
    

  }
  exec { 'firewall5800':
    command  => 'netsh advfirewall firewall add rule name="vnc5800" dir=in action=allow protocol=tcp localport=5800',
    path  => $::path,
    refreshonly => true,
    notify => Exec['firewall5900'],
    }
  exec { 'firewall5900':
    command => 'netsh advfirewall firewall add rule name="vnc5900" dir=in action=allow protocol=tcp localport=5900',
    path => $::path,
    notify => Exec['firewallvnc'],
    refreshonly => true,
    }
  exec { 'firewallvnc':
    command => 'netsh advfirewall firewall add rule name="winvnc" dir=in action=allow program="C:\Program Files\uvnc bvba\UltraVNC\winvnc.exe"',
    path => $::path,
    notify => Exec['firewallvncviewer'],
    refreshonly => true,
    }
  exec {'firewallvncviewer':
    command => 'netsh advfirewall firewall add rule name="winvncviewer" dir=in action=allow program="C:\Program Files\uvnc bvba\UltraVNC\vncviewer.exe"',
    path => $::path,
    refreshonly => true,
    }
  }
