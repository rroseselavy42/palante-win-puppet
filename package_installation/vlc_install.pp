class vlc_install {
$installsource = hiera('install:source')
$vlcversion = hiera('vlc:version')
if $::architecture == 'x86' {
    package{'VLC media player':
        ensure          => $vlcversion,
        source          => "${installsource}/vlc/vlc-${vlc:version}-win32.exe",
        install_options => ['/L=1033', '/S'],

}}
else {
    package{'VLC media player':
        ensure          => $vlcversion,
        source          => "${installsource}/vlc/vlc-${vlc:version}-win64.exe",
        install_options => ['/L=1033', '/S'],
}}
}
