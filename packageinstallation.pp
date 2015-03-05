#building better puppet software management
#take two
#set a software enviroment variable hiera will change this for every client
#doing it this way instead of hiera the install command itself in case 
class setsoftware {
  windows_env {'software':
    ensure    => present,
    variable  => 'SOFTWARE',
    value     => hiera('setsoftware::software'),
    mergemode => clobber }
    }


#I've got an idea for package installation

$installsource = hiera('install:source')

class firefox_install {
$installsource = hiera('install:source')
  $firefoxversion = hiera('firefox:version')
  package {"Mozilla Firefox ${firefoxversion} (x86 en-US)": #seriously the package name ughhhhhhhhhh use metadata
    ensure  => $firefoxversion,
    source  => "${installsource}/firefox/Firefox Setup ${firefoxversion}.exe",
    install_options => ['-ms'], 
    uninstall_options => ['/S'], }
  }
#jessie you will hate yourself someday for the way you are writing this
#please think about your future self here.

class thunderbird_install {
$installsource = hiera('install:source')
  $thunderbirdversion = hiera('thunderbird:version')
  package {"Mozilla Thunderbird ${thunderbirdversion} (x86 en-US)":
    ensure  => $thunderbirdversion,
    source  => "${installsource}/thunderbird/Thunderbird Setup ${thunderbirdversion}.exe",
    install_options => ['-ms'], 
    uninstall_options => ['/S'], }
  }
# Class: Adobe Reader
#
#
class adobeflashplugin_install {
  $installsource = hiera('install:source')
  $flashversion = hiera('flashplugin:version')
  $flashversionie = hiera('flashpluginie:version')
  $majversion = hiera('flashplugin:majversion')
  package {"Adobe Flash Player ${majversion} NPAPI":
    ensure => $flashversion,
    source => "${installsource}/adobeflashplayer/install_flash_player_${majversion}_plugin.exe",
    install_options => ['/install']
  }
  package {"Adobe Flash Player ${majversion} ActiveX":
    ensure => $flashversionie,
    source => "${installsource}/adobeflashplayer/install_flash_player_${majversion}_active_x.exe",
    install_options => ['/install']
  }
}


