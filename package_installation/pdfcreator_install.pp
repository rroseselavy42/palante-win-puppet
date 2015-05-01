class pdfcreator_install {
$installsource = hiera('install:source')
$version = hiera('pdfcreator:version')

    package{'PDFCreator':
        ensure          => $vlcversion,
        source          => "${installsource}/pdfcreator/PDFCreator-setup.exe",
        install_options => ['/VERYSILENT', '/NORESTART', '/SP-', '/DontUseYahooSearch', "/LOADINF=$installsource\pdfcreator\PDFCreator.inf"],
}
}

