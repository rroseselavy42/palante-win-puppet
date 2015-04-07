class java_install {
$installsource = hiera('install:source')
$javamajversion = hiera('javamajor:version')
$javaupdatenumber = hiera('javaupdate:number')
$javaversion = hiera('vlc:version')
if $::architecture == 'x86' {
    package{"Java ${javamajversion} Update ${javaupdatenumber}":
        ensure            => present,
        source            => "${installsource}/java/jre${javamajversion}_${javaversion}-x86.msi",
        install_options   => ['AUTO_UPDATE=0', 'EULA=0', 'NOSTARTMENU=1', 'SPONSORS=0', 'WEB_ANALYTICS=0', 'WEB_JAVA=1', 'WEB_JAVA_SECURITY_LEVEL=H', '/qn'],
        uninstall_options => ['/x', '/qn'],

}}
else {
    package{"Java ${javamajversion} Update ${javaupdatenumber}":
        ensure            => present,
        source            => "${installsource}/java/jre${javamajversion}_${javaversion}-x64.msi",
        install_options   => ['AUTO_UPDATE=0', 'EULA=0', 'NOSTARTMENU=1', 'SPONSORS=0', 'WEB_ANALYTICS=0', 'WEB_JAVA=1', 'WEB_JAVA_SECURITY_LEVEL=H', '/qn'],
        uninstall_options => ['/x', '/qn'],
}}
}