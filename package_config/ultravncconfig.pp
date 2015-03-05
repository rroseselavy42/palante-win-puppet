# Class: ultravncconfig
# configures ultravnc for you!
# uses ultravnc::passwd1 and passwd2 as hiera lookups
class ultravncconfig {

$ultravncconfigfile = 'C:/Program Files/uvnc bvba/UltraVNC/ultravnc.ini'

  ini_setting {'passwd1':
    ensure  => present,
    section => 'ultravnc',
    path    => $ultravncconfigfile,
    setting => 'passwd',
    value   => hiera('ultravnc::passwd1'),

    }
  ini_setting {'passwd2':
    ensure  => present,
    section => 'ultravnc',
    path    => $ultravncconfigfile,
    setting => 'passwd2',
    value   => hiera('ultravnc::passwd2'),
    }
  ini_setting {'UseRegistry':
    ensure  => present,
    section => 'admin',
    path    => $ultravncconfigfile,
    setting => 'UseRegistry',
    value   => 0,
  }
  
    ini_setting {'MSLogonRequired':
    ensure  => present,
    section => 'admin',
    path    => $ultravncconfigfile,
    setting => 'MSLogonRequired',
    value   => 0,
    }
  ini_setting {'DebugMode':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'DebugMode',
      value => 0, }
  ini_setting {'Avilog':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'Avilog',
      value => 0,
      }
  ini_setting {'AllowLoopback':
    ensure => present,
    section => 'admin',
    path => $ultravncconfigfile,
    setting => 'AllowLoopback',
     value => 1,

   }
  ini_setting {'AuthRequired':
    ensure => present,
    section => 'admin',
    path => $ultravncconfigfile,
    setting => 'AuthRequired',
     value => 1,

   }
  ini_setting {'ConnectPriority':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'ConnectPriority',
      value => 1,
      }
  ini_setting {'AllowProperties':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'AllowProperties',
      value => 1,
      }
  ini_setting {'portnumber':
      ensure => present,
    section=> 'admin',
    path => $ultravncconfigfile,
      setting => 'PortNumber',
      value => 5900, }
  ini_setting {'InputsEnabled':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'InputsEnabled',
      value => 1, }  
  ini_setting {'RemoveAero':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'RemoveAero',
      value => 1, }
  ini_setting {'AllowShutdown':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'AllowShutdown',
      value => 1,
      }
  ini_setting {'AllowEditClients':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'AllowEditClients',
      value => 1,
      }
  ini_setting {'FileTransferEnabled':
  ensure => present,
  section=> 'admin',
  path => $ultravncconfigfile,
  setting => 'FileTransferEnabled',
   value => 1,
   }
  ini_setting {'FTUserImpersonation':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'FTUserImpersonation',
      value => 1,
      }
  ini_setting {'BlankMonitorEnabled':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'BlankMonitorEnabled',
      value => 1,
      }
  ini_setting {'BlankInputsOnly':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'BlankInputsOnly',
      value => 0,
      }
  ini_setting {'DefaultScale':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'DefaultScale',
      value => 1,
      }
  ini_setting {'CaptureAlphaBlending':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'CaptureAlphaBlending',
      value => 1,
      }
  ini_setting {'BlackAlphaBlending':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'BlackAlphaBlending',
      value => 0,
      }
  ini_setting {'primary':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'primary',
      value => 1,
      }
  ini_setting {'secondary':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'secondary',
      value => 0,
      }
  ini_setting {'SocketConnect':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'SocketConnect',
      value => 1,
      }
  ini_setting {'HTTPConnect':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'HTTPConnect',
      value => 1,
      }
  ini_setting {'AutoPortSelect':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'AutoPortSelect',
      value => 1,
      }
  ini_setting {'HTTPPortNumber':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'HTTPPortNumber',
      value => 5800,
      }
  ini_setting {'IdleTimeout':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'IdleTimeout',
      value => 0,
      }
  ini_setting {'RemoveWallpaper':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'RemoveWallpaper',
      value => 1,
      }
  ini_setting {'QuerySetting':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'QuerySetting',
      value => 2,
      }
  ini_setting {'QueryTimeout':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'QueryTimeout',
      value => 10,
      }
  ini_setting {'QueryAccept':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'QueryAccept',
      value => 0,
      }
  ini_setting {'QueryIfNoLogon':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'QueryIfNoLogon',
      value => 1,
      }
  ini_setting {'LockSetting':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'LockSetting',
      value => 0,
      }
  ini_setting {'LocalinputsDisabled':
      ensure => present,
      section=> 'admin',
      path => $ultravncconfigfile,
      setting => 'LocalInputsDisabled',
      value => 0,
      }
  ini_setting {'TurboMode':
      ensure => present,
      section=> 'poll',
      path => $ultravncconfigfile,
      setting => 'TurboMode',
      value => 1,
      }
  ini_setting {'PollUnderCursor':
      ensure => present,
      section=> 'poll',
      path => $ultravncconfigfile,
      setting => 'PollUnderCursor',
      value => 0,
      }
  ini_setting {'PollForeground':
      ensure => present,
      section=> 'poll',
      path => $ultravncconfigfile,
      setting => 'PollForeground',
      value => 0,
      }
  ini_setting {'PollFullScreen':
      ensure => present,
      section=> 'poll',
      path => $ultravncconfigfile,
      setting => 'PollFullScreen',
      value => 1,
      }
  ini_setting {'OnlyPollConsole':
      ensure => present,
      section=> 'poll',
      path => $ultravncconfigfile,
      setting => 'OnlyPollConsole',
      value => 0,
      }
  ini_setting {'OnlyPollOnEvent':
      ensure => present,
      section=> 'poll',
      path => $ultravncconfigfile,
      setting => 'OnlyPollOnEvent',
      value => 0,
      }
  ini_setting {'MaxCpu':
      ensure => present,
      section=> 'poll',
      path => $ultravncconfigfile,
      setting => 'MaxCpu',
      value => 40,
      }
  ini_setting {'EnableDriver':
      ensure => present,
      section=> 'poll',
      path => $ultravncconfigfile,
      setting => 'EnableDriver',
      value => 1,
      }
  ini_setting {'EnableHook':
      ensure => present,
      section=> 'poll',
      path => $ultravncconfigfile,
      setting => 'EnableHook',
      value => 1,
      }
  ini_setting {'EnableVirtual':
      ensure => present,
      section=> 'poll',
      path => $ultravncconfigfile,
      setting => 'EnableVirtual',
      value => 0,
      }
  ini_setting {'SingleWindow':
      ensure => present,
      section=> 'poll',
      path => $ultravncconfigfile,
      setting => 'SingleWindow',
      value => 0,
      }
  }