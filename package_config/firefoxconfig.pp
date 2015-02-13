class firefoxconfig {
  file_line { 'hideup':
    path => '%PROGRAMFILESDIR%/Mozilla Firefox/mozilla.cfg',
    line => 'lockPref("browser.startup.homepage_override.mstone", "ignore");',
  
    }
  file_line { 'nodefault':
    path => '%PROGRAMFILESDIR%/Mozilla Firefox/mozilla.cfg',
    line => 'lockPref("browser.shell.checkDefaultBrowser", false);',

    }
  file_line { 'noupdate':
    path => '%PROGRAMFILESDIR%/Mozilla Firefox/mozilla.cfg',
    line => 'lockPref("app.update.enabled", false);',
    }
}