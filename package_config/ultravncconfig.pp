# Class: ultravncconfig
# configures ultravnc for you!
# uses ultravnc::passwd1 and passwd2 as hiera lookups
class ultravncconfig {

$configfile = 'C:/Program Files/uvnc bvba/UltraVNC/ultravnc.ini'

  ini_setting {'passwd1':
    ensure  => present,
    section => 'ultravnc',
    path    => $configfile,
    setting => 'passwd',
    value   => hiera('ultravnc::passwd1'),

    }
  ini_setting {'passwd2':
    ensure  => present,
    section => 'ultravnc',
    path    => $configfile,
    setting => 'passwd2',
    value   => hiera('ultravnc::passwd2'),
    }
  ini_setting {'UseRegistry':
    ensure  => present,
    section => 'admin',
    path    => $configfile,
    setting => 'UseRegistry',
    value   => 0,
  }
  
    ini_setting {'MSLogonRequired':
    ensure  => present,
    section => 'admin',
    path    => $configfile,
    setting => 'MSLogonRequired',
    value   => 0,
    }
  ini_setting {'DebugMode':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'DebugMode',
      value => 0, }
  ini_setting {'Avilog':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'Avilog',
      value => 0,
      }
  ini_setting {'AllowLoopback':
    ensure => present,
    section => 'admin',
    path => $configfile,
    setting => 'AllowLoopback',
     value => 1,

   }
  ini_setting {'AuthRequired':
    ensure => present,
    section => 'admin',
    path => $configfile,
    setting => 'AuthRequired',
     value => 1,

   }
  ini_setting {'ConnectPriority':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'ConnectPriority',
      value => 1,
      }
  ini_setting {'AllowProperties':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'AllowProperties',
      value => 1,
      }
  ini_setting {'portnumber':
      ensure => present,
    section=> 'admin',
    path => $configfile,
      setting => 'PortNumber',
      value => 5900, }
  ini_setting {'InputsEnabled':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'InputsEnabled',
      value => 1, }  
  ini_setting {'RemoveAero':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'RemoveAero',
      value => 1, }
  ini_setting {'AllowShutdown':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'AllowShutdown',
      value => 1,
      }
  ini_setting {'AllowEditClients':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'AllowEditClients',
      value => 1,
      }
  ini_setting {'FileTransferEnabled':
  ensure => present,
  section=> 'admin',
  path => $configfile,
  setting => 'FileTransferEnabled',
   value => 1,
   }
  ini_setting {'FTUserImpersonation':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'FTUserImpersonation',
      value => 1,
      }
  ini_setting {'BlankMonitorEnabled':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'BlankMonitorEnabled',
      value => 1,
      }
  ini_setting {'BlankInputsOnly':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'BlankInputsOnly',
      value => 0,
      }
  ini_setting {'DefaultScale':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'DefaultScale',
      value => 1,
      }
  ini_setting {'CaptureAlphaBlending':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'CaptureAlphaBlending',
      value => 1,
      }
  ini_setting {'BlackAlphaBlending':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'BlackAlphaBlending',
      value => 0,
      }
  ini_setting {'primary':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'primary',
      value => 1,
      }
  ini_setting {'secondary':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'secondary',
      value => 0,
      }
  ini_setting {'SocketConnect':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'SocketConnect',
      value => 1,
      }
  ini_setting {'HTTPConnect':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'HTTPConnect',
      value => 1,
      }
  ini_setting {'AutoPortSelect':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'AutoPortSelect',
      value => 1,
      }
  ini_setting {'HTTPPortNumber':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'HTTPPortNumber',
      value => 5800,
      }
  ini_setting {'IdleTimeout':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'IdleTimeout',
      value => 0,
      }
  ini_setting {'RemoveWallpaper':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'RemoveWallpaper',
      value => 1,
      }
  ini_setting {'QuerySetting':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'QuerySetting',
      value => 2,
      }
  ini_setting {'QueryTimeout':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'QueryTimeout',
      value => 10,
      }
  ini_setting {'QueryAccept':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'QueryAccept',
      value => 0,
      }
  ini_setting {'QueryIfNoLogon':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'QueryIfNoLogon',
      value => 1,
      }
  ini_setting {'LockSetting':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'LockSetting',
      value => 0,
      }
  ini_setting {'LocalinputsDisabled':
      ensure => present,
      section=> 'admin',
      path => $configfile,
      setting => 'LocalInputsDisabled',
      value => 0,
      }
  ini_setting {'TurboMode':
      ensure => present,
      section=> 'poll',
      path => $configfile,
      setting => 'TurboMode',
      value => 1,
      }
  ini_setting {'PollUnderCursor':
      ensure => present,
      section=> 'poll',
      path => $configfile,
      setting => 'PollUnderCursor',
      value => 0,
      }
  ini_setting {'PollForeground':
      ensure => present,
      section=> 'poll',
      path => $configfile,
      setting => 'PollForeground',
      value => 0,
      }
  ini_setting {'PollFullScreen':
      ensure => present,
      section=> 'poll',
      path => $configfile,
      setting => 'PollFullScreen',
      value => 1,
      }
  ini_setting {'OnlyPollConsole':
      ensure => present,
      section=> 'poll',
      path => $configfile,
      setting => 'OnlyPollConsole',
      value => 0,
      }
  ini_setting {'OnlyPollOnEvent':
      ensure => present,
      section=> 'poll',
      path => $configfile,
      setting => 'OnlyPollOnEvent',
      value => 0,
      }
  ini_setting {'MaxCpu':
      ensure => present,
      section=> 'poll',
      path => $configfile,
      setting => 'MaxCpu',
      value => 40,
      }
  ini_setting {'EnableDriver':
      ensure => present,
      section=> 'poll',
      path => $configfile,
      setting => 'EnableDriver',
      value => 1,
      }
  ini_setting {'EnableHook':
      ensure => present,
      section=> 'poll',
      path => $configfile,
      setting => 'EnableHook',
      value => 1,
      }
  ini_setting {'EnableVirtual':
      ensure => present,
      section=> 'poll',
      path => $configfile,
      setting => 'EnableVirtual',
      value => 0,
      }
  ini_setting {'SingleWindow':
      ensure => present,
      section=> 'poll',
      path => $configfile,
      setting => 'SingleWindow',
      value => 0,
      }
  }