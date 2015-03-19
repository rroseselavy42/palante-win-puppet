class greenshot_install {
$version = hiera('greenshot:version')
$installsource = hiera('install:source')
$sysdrive = hiera('systemdrive')
    package { "Greenshot ${version}":
        ensure          => $version,
        source          => "${installsource}/greenshot/Greenshot-INSTALLER-${version}.exe",
        install_options => ['/VERYSILENT', '/LOADINF="%SOFTWARE%\greenshot\greenshot.inf"', '/NORESTART', '/NORUN'],
    }
    file { "${sysdrive}:/Program Files/Greenshot/greenshot-defaults.ini":
        ensure => file,
        source => "${installsource}/greenshot/Greenshot-defaults.ini"
    }
}