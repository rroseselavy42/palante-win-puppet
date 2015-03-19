class ultravncpassword {

$ultravncconfigfile = 'C:/Program Files/uvnc bvba/UltraVNC/ultravnc.ini'

  ini_setting {'passwd1':
    ensure  => present,
    section => 'ultravnc',
    path    => 'C:/Program Files/uvnc bvba/UltraVNC/ultravnc.ini',
    setting => 'passwd',
    value   => hiera('ultravnc::passwd1'),
    notify  => Service['uvnc_service'],
    

    }
  ini_setting {'passwd2':
    ensure  => present,
    section => 'ultravnc',
    path    => 'C:/Program Files/uvnc bvba/UltraVNC/ultravnc.ini',
    setting => 'passwd2',
    value   => hiera('ultravnc::passwd2')
    notify  => Service['uvnc_service'],

    }
      service { 'uvnc_service':
    enable      => true,
    ensure      => running,
    refreshonly => true,

  }
}