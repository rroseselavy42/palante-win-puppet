#class package-fetching {
#
#
#}
#adobereader might be a hard one
#class adobereader::fetch {
#	$adobereaderversion = hiera('adobereader:version')
#	$adobereadermajversion = hiera('adobereader:majversion')
#	wget::fetch {'adobereader':
#		source =>'http://ardownload.adobe.com/pub/adobe/reader/win/{mainversion}.x/{version}/en_US/AdbeRdr$adobereaderversion_en_US.exe'}
#}
#firefox is easier let's try that first!
class firefox:fetch {
	$firefoxversion = hiera('firefox:version')
	$destination = "/home/rsyncclient/downloads/wpkgsoftware/firefox/Firefox Setup ${firefoxversion}.exe"
	wget::fetch {"download Firefox":
		source => "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/latest/win32/en-US/Firefox%20Setup%20${firefoxversion}.exe",
		cache_dir => '/home/rsyncclient/downloads/wpkgsoftware/firefox/',
		cache_file => "Firefox Setup ${firefoxversion}.exe",
		destination => $destination,  }

	}
class thunderbird:fetch {
	$thunderbirdversion = hiera('thunderbird:version')
  $destination = "/home/rsyncclient/downloads/wpkgsoftware/thunderbird/Thunderbird Setup ${thunderbirdversion}.exe"
	wget::fetch {"download Thunderbird":
		source => "ftp://ftp.mozilla.org/pub/mozilla.org/thunderbird/releases/latest/win32/en-US/Thunderbird%20Setup%20${thundebirdversion}.exe",
		destination => '/home/rsyncclient/downloads/wpkgsoftware/thunderbird/',
		cache_dir => '/home/rsyncclient/downloads/wpkgsoftware/thunderbird/',
		}
}
class ccleaner:fetch {
  $ccleanerversion = hiera('ccleaner:version')
  $destination = "/home/rsyncclient/downloads/tools/ccleaner/ccleanerportable.zip"
  wget::fetch {'ccleanerportable':  
    source => "http://www.piriform.com/ccleaner/download/portable/downloadfile",
    destination => $destination,
    cache_dir => '/var/cache/wget', }
  exec {'unzip':
    command => "unzip $destination -d /home/rsyncclient/downloads/tools/ccleaner/",
    path    => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
    subscribe => Wget::fetch['ccleanerportable'],
    }
  exec { 'removezip':
     path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
     refreshonly => true,
     command => "rm -rf $destination",
     subscribe => Exec['unzip'], }
  }
class { 'filezilla:fetch':
  $filezillaversion = hiera('filezilla:version')
  $destination = '/home/rsyncclient/downloads/wpkgsoftware/filezilla'
  wget::fetch {"download filezilla":
    source => "http://downloads.sourceforge.net/project/filezilla/FileZilla_Client/${filezillaversion}/FileZilla_${filezillaversion}_win32-setup.exe?r=&ts=1397254563&use_mirror=hivelocity",
    destination => "${destination}/FileZilla_${filezillaversion}_win32-setup.exe",
    cache_dir => "$destination",
    }
class { 'flash:fetch':
  $flashversion = hiera('flash:version')
  $flashmajversion = hiera('flash:majversion')
  $destination = '/home/rsyncclient/downloads/wpkgsoftware/adobeflashplayer'
  wget::fetch { "fetch flashie": 
    source => "http://download.macromedia.com/get/flashplayer/current/licensing/win/install_flash_player_${flashmajversion}_active_x.exe",
    destination => "${destination}/install_flash_player_${flashmajversion}_active_x.exe",
    cache_dir => "$destination",
  }
  wget::fetch { "fetch flashplugin":
    source =>"http://download.macromedia.com/get/flashplayer/current/licensing/win/install_flash_player_${flashmajversion}_plugin.exe",
    destination => "${destination}/install_flash_player_${flashmajversion}_plugin.exe",
    cache_dir => "$destination",
  }
}
class { 'foxit:fetch':
  $foxitversion = hiera('foxit:version') #reflecting the URL version fix this later
  $destination = "/home/rsyncclient/downloads/wpkgsoftware/foxitreader"
  $foxitURL = hiera('foxit:url')
  wget::fetch {"fetch foxit":
    source => $foxitURL,
    destination => "$destination/EnterpriseFoxitReader${foxitversion}_enu.msi", # this version reflects the url xxx.xxxx
    cache_dir => "$destination",
    }
  }
class { 'libreoffice:fetch':
  $libreofficeversion = hiera('libreoffice:version')
  $destination = "/home/rsyncclient/downloads/wpkgsoftware/libreoffice"
  wget::fetch {'fetch libreoffice':
    source => "http://download.documentfoundation.org/libreoffice/stable/${libreofficeversion}/win/x86/LibreOffice_${libreofficeversion}_Win_x86.msi",
    destination => "${destination}/LibreOffice_${libreofficeversion}_Win_x86.msi",
    cache_dir => "$destination",
    }
  }
class { 'greenshot:fetch':
  $greenshotversion = hiera('greenshot:version')
  $destination = "/home/rsyncclient/downloads/wpkgsoftware/greenshot"
  wget::fetch {'fetch greenshot':
    source => "http://downloads.sourceforge.net/project/greenshot/Greenshot/Greenshot%201.1/Greenshot-INSTALLER-${greenshotversion}.exe?r=&ts=1397255499&use_mirror=softlayer-dal",
    destination => "${destination}/Greenshot-INSTALLER-${greenshotversion}.exe",
    cache_dir => "$destination",
    }
  }
class { 'notepadplusplus:fetch':
  $notepadplusplusversion = hiera('notepadplusplus:version')
  $destination = "/home/rsyncclient/downloads/wpkgsoftware/notepadplusplus"
  wget::fetch {'fetch notepadplusplus':
    source => "http://download.tuxfamily.org/notepadplus/${notepadplusplusversion}/npp.${notepadplusplusversion}.Installer.exe",
    destination => "${destination}/npp.${notepadplusplusversion}.Installer.exe",
    cache_dir => "$destination",
    }
  }
#not a good download link another $url variable :-((( 
# keeping ultravncversion variable to be hopeful.
class { 'ultravnc:fetch':
  $ultravncversion = hiera('ultravnc:version')
  $ultravncurl = hiera('ultravnc:url')
  $destination = "/home/rsyncclient/downloads/wpkgsoftware/ultravnc"
  wget::fetch {'fetch ultravnc':
    source  => "$ultravncurl",
    #need to figure out how to do the x64 and x86 >_>
    destination  => "${destination}/UltraVNC_1_2_01_X64_Setup.exe",
    cache_dir  => "$destination",}
  }
  #noversioning on this, not sure if it will update properly but we'll see?
  #if not I can have it rename the destination file to incorperate version. 
class {'skype:fetch':
  $skypeversion = hiera('skype:version')
  $destination = "/home/rsyncclient/downloads/wpkgsoftware/skype"
  wget::fetch {'fetch skype':
    source => "http://www.skype.com/go/getskype-msi",
    destination => "${destination}/SkypeSetup.msi",
    cache_dir => "$destination",
    }
  }
class {'sysinternals:fetch':
  $sysinternalsversion = hiera('sysinternals:version')
  $destination = "/home/rsyncclient/downloads/tools/SysinternalsSuite"}