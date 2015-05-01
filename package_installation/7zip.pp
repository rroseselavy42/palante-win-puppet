class 7zip_install {
$installsource = hiera('install:source')
$packageversion = hiera('7zip:version')
$filename_version = hiera('7zip:filenameversion')
if $::architecture == 'x86' {
    package{"7-Zip $packageversion":
        ensure          => $packageversion,
        source          => "${installsource}/7zip/7z${packageversion}.msi",
        install_options => [ '/qn'],
}
}
else {
    package{"7-Zip $packageversion (x64 edition)":
        ensure          => $packageversion,
        source          => "${installsource}/7zip/7z${packageversion}-x64.msi",
        install_options => [ '/qn'],
}
}
}
