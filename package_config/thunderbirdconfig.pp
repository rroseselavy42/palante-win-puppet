#If this works and I think it will i may use this as basis for future configs. 
class thunderbirdconfig {
  $thunderbirdpolicyjs = hiera('thunderbird:policyjs')
  if $::architecture == 'x64' {
    $installpath = '%PROGRAMFILES32%/Mozilla Thunderbird'
  }
  else {
    $installpath = '%PROGRAMFILES%/Mozilla Thunderbird'
  }
  file_line { 'policyjs':
    path => "${installpath}/defaults/pref/policies.js", 
    line => $thunderbirdpolicyjs, }
  $thunderbirdconfig = hiera('thunderbird:config')
  file_line {'config':
    path => "${installpath}/",
    line => $thunderbirdconfig, }
  }