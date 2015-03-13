class adobereader_install {
$installsource = hiera('install:source')
$adobeversion = hiera('adobereader:version')
$versionnumeral = hiera('adobe:numeral')
    package{"Adobe Reader ${versionnumeral} (${adobeversion})":
        ensure          => $adobeversion,
        source          => "${installsource}/adobereader/AdbeRdr${adobeversion}_en_US.exe",
        install_options => ['/sALL'],

}