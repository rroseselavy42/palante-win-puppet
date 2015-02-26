# Class: Timeservice
# checks registry values to turn on NTP
#uses hiera lookup to figure out what server to default to.
class timeservice {  
  $ntpserver = hiera('ntp:server')
  registry::value {'NTPon':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\Parameters',
    value => Type,
    data  => 'NTP',
  }
  registry::value {'NTPserver':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\Parameters',
    value => NtpServer,
    data  => $ntpserver,
  }
}
