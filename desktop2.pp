#building better puppet software management
#take two
#set a software enviroment variable hiera will change this for every client
#doing it this way instead of hiera the install command itself in case 
#I want to set up chocolatey to use the variable. 
class setsoftware {
  windows_env {'software':
    ensure    => present,
    variable  => 'SOFTWARE',
    value     => hiera('setsoftware::software'),
    mergemode => clobber }
    }

#now that we have this variable set make sure chocolatey grabs the executable 
#from local.  I think we need to use install options
class desktoppackages  {
  #use a hiera array to grab from ALL layers of hiera allowing per 
  #computer setup and setup per client
  $pkg = hiera_array('desktop-packages::packages')
  package {$pkg:
    ensure => latest,
    #this probably will break
    source => '$SOFTWARE',
  }

  }
class standardconfig {
  include ultravncconfig
  include firefoxconfig
  include thunderbirdconfig
}
#separating package installation and config because makes my life easier
#this is ugly but effective, probably will clean this up later
class ultravnc-config {



  ini_setting {'passwd1':
    ensure  => present,
    section => 'ultravnc',
    path    => '%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
    setting => 'passwd',
    value   => hiera(ultravnc::passwd1),

    }
  ini_setting {'passwd2':
    ensure  => present,
    section => 'ultravnc',
    path    =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
    setting => 'passwd2',
    value   => hiera('ultravnc::passwd2'),
    }
  ini_setting {'UseRegistry':
    ensure   => present,
    section  => 'admin',
    path     =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
     setting => 'UseRegistry',
     value => 0,}    
  ini_setting {'MSLogonRequired':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'MSLogonRequired',
      value => 0,
     }
  ini_setting {'DebugMode':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'DebugMode',
      value => 0, }
  ini_setting {'Avilog':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'Avilog',
      value => 0,
      }
  ini_setting {'AllowLoopback':
    ensure => present,
    section => 'admin',
    path => '%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
    setting => 'AllowLoopback',
     value => 1,

   }
  ini_setting {'AuthRequired':
    ensure => present,
    section => 'admin',
    path => '%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
    setting => 'AuthRequired',
     value => 1,

   }
  ini_setting {'ConnectPriority':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'ConnectPriority',
      value => 1,
      }
  ini_setting {'AllowProperties':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'AllowProperties',
      value => 1,
      }
  ini_setting {'portnumber':
      ensure => present,
    section=> 'admin',
    path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'PortNumber',
      value => 5900, }
  ini_setting {'InputsEnabled':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'InputsEnabled',
      value => 1, }  
  ini_setting {'RemoveAero':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'RemoveAero',
      value => 1, }
  ini_setting {'AllowShutdown':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'AllowShutdown',
      value => 1,
      }
  ini_setting {'AllowEditClients':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => "AllowEditClients",
      value => 1,
      }
  ini_setting {'FileTransferEnabled':
  ensure => present,
  section=> 'admin',
  path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
  setting => 'FileTransferEnabled',
   value => 1,
   }
  ini_setting {'FTUserImpersonation':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'FTUserImpersonation',
      value => 1,
      }
  ini_setting {'BlankMonitorEnabled':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'BlankMonitorEnabled',
      value => 1,
      }
  ini_setting {'BlankInputsOnly':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'BlankInputsOnly',
      value => 0,
      }
  ini_setting {'DefaultScale':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'DefaultScale',
      value => 1,
      }
  ini_setting {'CaptureAlphaBlending':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'CaptureAlphaBlending',
      value => 1,
      }
  ini_setting {'BlackAlphaBlending':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'BlackAlphaBlending',
      value => 0,
      }
  ini_setting {'primary':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'primary',
      value => 1,
      }
  ini_setting {'secondary':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'secondary',
      value => 0,
      }
  ini_setting {'SocketConnect':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'SocketConnect',
      value => 1,
      }
  ini_setting {'HTTPConnect':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'HTTPConnect',
      value => 1,
      }
  ini_setting {'AutoPortSelect':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'AutoPortSelect',
      value => 1,
      }
  ini_setting {'HTTPPortNumber':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'HTTPPortNumber',
      value => 5800,
      }
  ini_setting {'IdleTimeout':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'IdleTimeout',
      value => 0,
      }
  ini_setting {'RemoveWallpaper':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'RemoveWallpaper',
      value => 1,
      }
  ini_setting {'QuerySetting':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'QuerySetting',
      value => 2,
      }
  ini_setting {'QueryTimeout':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'QueryTimeout',
      value => 10,
      }
  ini_setting {'QueryAccept':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'QueryAccept',
      value => 0,
      }
  ini_setting {'QueryIfNoLogon':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'QueryIfNoLogon',
      value => 1,
      }
  ini_setting {'LockSetting':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'LockSetting',
      value => 0,
      }
  ini_setting {'LocalinputsDisabled':
      ensure => present,
      section=> 'admin',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'LocalInputsDisabled',
      value => 0,
      }
  ini_setting {'TurboMode':
      ensure => present,
      section=> 'poll',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'TurboMode',
      value => 1,
      }
  ini_setting {'PollUnderCursor':
      ensure => present,
      section=> 'poll',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'PollUnderCursor',
      value => 0,
      }
  ini_setting {'PollForeground':
      ensure => present,
      section=> 'poll',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'PollForeground',
      value => 0,
      }
  ini_setting {'PollFullScreen':
      ensure => present,
      section=> 'poll',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'PollFullScreen',
      value => 1,
      }
  ini_setting {'OnlyPollConsole':
      ensure => present,
      section=> 'poll',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'OnlyPollConsole',
      value => 0,
      }
  ini_setting {'OnlyPollOnEvent':
      ensure => present,
      section=> 'poll',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'OnlyPollOnEvent',
      value => 0,
      }
  ini_setting {'MaxCpu':
      ensure => present,
      section=> 'poll',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'MaxCpu',
      value => 40,
      }
  ini_setting {'EnableDriver':
      ensure => present,
      section=> 'poll',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'EnableDriver',
      value => 1,
      }
  ini_setting {'EnableHook':
      ensure => present,
      section=> 'poll',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'EnableHook',
      value => 1,
      }
  ini_setting {'EnableVirtual':
      ensure => present,
      section=> 'poll',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'EnableVirtual',
      value => 0,
      }
  ini_setting {'SingleWindow':
      ensure => present,
      section=> 'poll',
      path =>'%PROGRAMFILESDIR%/uvnc bvba/UltraVNC/ultravnc.ini',
      setting => 'SingleWindow',
      value => 0,
      }
  }
#firefox config will make sure each line is present in the document. 
class firefoxconfig {
  file_line { 'hideup':
    path => '%PROGRAMFILESDIR%/Mozilla Firefox/mozilla.cfg',
    line => 'lockPref("browser.startup.homepage_override.mstone", "ignore");',
  
    }
  file_line { 'nodefault':
    path => '%PROGRAMFILESDIR%/Mozilla Firefox/mozilla.cfg',
    line => 'lockPref("browser.shell.checkDefaultBrowser", false);',

    }
  file_line { 'noupdate':
    path => '%PROGRAMFILESDIR%/Mozilla Firefox/mozilla.cfg',
    line => 'lockPref("app.update.enabled", false);',
    }
}
#If this works and I think it will i may use this as basis for future configs. 
class thunderbirdconfig {
  $thunderbirdpolicyjs = hiera('thunderbird:policyjs')
  if $architecture == 'amd64' {
    $installpath = '%PROGRAMFILES32%/Mozilla Thunderbird'
  }
  else {
    $installpath = '%PROGRAMFILES%/Mozilla Thunderbird'
  }
  file_line { 'policyjs':
    path => "${installpath}/defaults/pref/policies.js", 
    line => '$thunderbirdpolicyjs', }
  $thunderbirdconfig = hiera('thunderbird:config')
  file_line {'config':
    path => "${installpath}/",
    line => "$thunderbirdconfig, }
  }
#I've got an idea for package installation

$installsource = hiera('install:source')

class { 'firefox:install':
  $firefoxversion = hiera('firefox:version')
  package {"Mozilla Firefox ${firefoxversion} (x86 en-US)": #seriously the package name ughhhhhhhhhh use metadata
    ensure => installed,
    source => "${installsource}/firefox/Firefox Setup ${firefoxversion}.exe",
    install_options => ['-ms'], 
    uninstall_options => ['/S'], }