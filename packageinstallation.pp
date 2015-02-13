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

class { 'firefox:install':
  $firefoxversion = hiera('firefox:version')
  package {"Mozilla Firefox ${firefoxversion} (x86 en-US)": #seriously the package name ughhhhhhhhhh use metadata
    ensure => installed,
    source => "${installsource}/firefox/Firefox Setup ${firefoxversion}.exe",
    install_options => ['-ms'], 
    uninstall_options => ['/S'], }