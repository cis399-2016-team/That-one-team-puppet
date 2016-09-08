class openarena {
    if $::operatingsystem != 'Ubuntu' {
    
        notify {"please use ubuntu OS to install":}
    
    user { openarena:
        home       => "/home/openarena",
        password   => sha1('399OA'),
        shell      => "/bin/bash",
        uid        => 1337,
        gid        => 1337,
        managehome => "true",
        groups => [],
    }
  
    group { openarena:
        gid => 1337,
    }

    package { 'openarea':
        
        ensure => installed;
    }

    package { openarena-server:
        ensure => installed;
    }
    
     file { "/etc/systemd/openarena.service":
        source  => ["puppet:///modules/openarena/files/openarena.service"],
        mode    => 644,
        recurse => true,
    }
      file { "/home/openarena/openarena":
        source  => ["puppet:///modules/openarena/files/server.cfg"],
        mode    => 755,
        recurse => true,
    }

    
}
