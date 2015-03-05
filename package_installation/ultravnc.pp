class ultravnc_install {
  $installsource = hiera('install:source')
  $ultravncversion = hiera('ultravnc:version')
  if $::architecture == 'x86' {
    package {"UltraVnc":
      ensure => $ultravncversion,
    #it would be great if 
    #I could convert . to _ for this
    #I will deal with it later YOLO 
      source => "${installsource}/ultravnc/UltraVNC_1_2_05_X86_Setup.exe",
      install_options => ['/verysilent','/norestart','loadinf="%SOFTWARE%/ultravnc/ultravnc.ini"'],
      notify => Exec['addons']

    }
      exec { 'addons':
        command      => '%SOFTWARE%\\ultravnc\\UltraVNC_1_1_9_X86_Addons.exe /verysilent /loadinf="%SOFTWARE%\\ultravnc\\addons.inf"',
        refreshonly => true,
        path => $::path,
        notify => Exec['certinstall'],
        require => Class['setsoftware'],
      }

  
      exec { 'certinstall':
        command      => '%comspec% /c %SOFTWARE%\\ultravnc\\certmgr.exe -add %SOFTWARE%\\ultravnc\\ultravnc_x86.cer -s -r localMachine trustedpublisher',
        refreshonly => true,
        path => $::path,
        notify => Exec['mirrordriver'],
      }
        exec { 'mirrordriver':
    command      => '"%SOFTWARE%\\ultravnc\\devcon_x86.exe" update "C:\\Program Files\\uvnc bvba\\UltraVNC\\driver\\driver\\mv2.inf" mv_hook_display_driver2',
    refreshonly => true,
    path => $::path,
    notify     => Exec['setupdrv'],
  }
    }
  else {
    package {"UltraVnc":
      ensure => $ultravncversion,
      #it would be great if 
      #I could convert . to _ for this
      #I will deal with it later YOLO 
      source => "${installsource}/ultravnc/UltraVNC_1_2_05_X64_Setup.exe",
      install_options => ['/very silent', '/no restart', 'loadinf="%SOFTWARE%/ultravnc/ultravnc.ini"' ],
  }
      exec { 'addons':
        command      => '%SOFTWARE%\\ultravnc\\UltraVNC_1_1_9_X64_Addons.exe /verysilent /loadinf="%SOFTWARE%\ultravnc\addons.inf',
        refreshonly => true,
        notify => Exec['certinstall'],
        path => $::path,
      }

  
      exec { 'certinstall':
        command      => '%comspec% /c %SOFTWARE%\\ultravnc\\certmgr.exe -add %SOFTWARE%\\ultravnc\\ultravnc_x64.cer -s -r localMachine trustedpublisher',
        refreshonly => true,
        path =>  $::path,
        notify => Exec['mirrordriver'],
      }
        exec { 'mirrordriver':
    command      => '"%SOFTWARE%\\ultravnc\\devcon_x64.exe" update "C:\\Program Files\\uvnc bvba\\UltraVNC\\driver\\driver\\mv2.inf" mv_hook_display_driver2',
    refreshonly => true,
    path => $::path,
    notify     => Exec['setupdrv'],
  }
  }
  exec { 'setupdrv':
    command      => '"%PROGRAMFILESDIR%\\uvnc bvba\\UltraVNC\\driver\\setupdrv.exe" installs',
    refreshonly => true,
    path => $::path,
    notify =>  Service['uvnc_service'],
  }
  service { 'uvnc_service':
    enable      => true,
    ensure      => running,
    notify      => Exec['softwarecad']
  }
  exec { 'softwarecad':
    command      => '"%PROGRAMFILESDIR%\\uvnc bvba\\UltraVNC\\winvnc.exe" -softwarecad',
    refreshonly => true,
    path => $::path,
  }

  }
