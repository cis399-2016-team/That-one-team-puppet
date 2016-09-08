class apache {

    if $::operatingsystem == 'Amazon' or $::operatingsystem == 'RedHat' {
        $apachepkg = 'httpd'
    } elsif $::operatingsystem == 'Ubuntu' {
        $apachepkg = 'apache2'
    } else {
        notify {"Apache is not supported on this distro.":}
    }

    package { 'apache':
        name   => $apachepkg,
        ensure => installed;
    }

    service { 'apache':
        name   => $apachepkg,
        enable => true,
        ensure => running,
        hasstatus => true,
        hasrestart => true,
    }

    file { "/var/www/html":
        source  => ["puppet:///modules/apache/html"],
        mode    => 644,
        recurse => true,
    }
}

