class ocsngagent_install {
  $installsource = hiera('install:source')
  $ocsngagentversion = hiera('ocsngagent:version')
  $ocsserver = hiera('ocs:server')
  package { "OCS Inventory NG Agent ${ocsngagentversion}":
    ensure          => $ocsngagentversion,
    source          => "${installsource}/ocsinventory/OCS-NG-Windows-Agent-Setup.exe",
    install_options => ['/S', "/SERVER=${ocsserver}"],
    notify          => Exec['cacert']

  }
  exec { 'cacert':
    command     => 'cmd.exe /c copy %SOFTWARE%\ocsinventory\cacert.pem "%PROGRAMDATA%\OCS Inventory NG\Agent"',
    path        => $::path,
    refreshonly => true,
  }
}
