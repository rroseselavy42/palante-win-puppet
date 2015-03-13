class adobereader_install {
$installsource = hiera('install:source')
$adobeversion = hiera('adobereader:version')
$adobeversion2 = hiera('adobereader:packageversion')
$versionnumeral = hiera('adobe:numeral')
    package{"Adobe Reader ${versionnumeral} (${adobeversion})":
        ensure          => $adobeversion,
        source          => "${installsource}/adobereader/AdbeRdr${adobeversion2}_en_US.exe",
        install_options => ['/sALL'],

}
}
