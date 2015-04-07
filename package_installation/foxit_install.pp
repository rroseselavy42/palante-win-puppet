class foxit_install {
$installsource = hiera('install:source')
$foxitversion = hiera('foxit:version')
$filename_version = hiera('foxit:filenameversion')
    package{'Foxit Reader':
        ensure          => $foxitversion,
        source          => "${installsource}/foxitreader/nterpriseFoxitReader${filename_version}_enu.msi",
        install_options => [ 'DESKTOP_SHORTCUT="0"', 'MAKEDEFAULT="1"', 'VIEWINBROWSER="0"', '/passive', '/norestart', '/qn'],
}
}
