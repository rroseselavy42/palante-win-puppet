class firefoxconfig {
  $hideup = "lockPref("browser.startup.homepage_override.mstone", "ignore");"
  $nodefault = "lockPref("browser.shell.checkDefaultBrowser", false);"
  $noupdate = "lockPref("app.update.enabled", false);"
  if $::architecture == 'x86' {
  file_line { 'hideup':
    path => 'C:/Program Files/Mozilla Firefox/mozilla.cfg,
    line => $hideup,
  
    }
  file_line { 'nodefault':
    path => 'C:/Program Files/Mozilla Firefox/mozilla.cfg,
    line => $nodefault,

    }
  file_line { 'noupdate':
    path => 'C:/Program Files/Mozilla Firefox/mozilla.cfg,
    line => $noupdate,
    }
  }
  else {
    file_line { 'hideup':
    path => 'C:/Program Files (x86)/Mozilla Firefox/mozilla.cfg',
    line => $hideup,
  
    }
  file_line { 'nodefault':
    path => '%PROGRAMFILESDIR32%/Mozilla Firefox/mozilla.cfg',
    line => $nodefault,

    }
  file_line { 'noupdate':
    path => '%PROGRAMFILESDIR32%/Mozilla Firefox/mozilla.cfg',
    line => $noupdate,
    }
  }
}
