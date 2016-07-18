class apache {

    notify {"Your os family is $::operatingsystem":}

    if $::osfamily == 'RedHat' {
        $apachepkg = 'httpd'
    } elsif $::osfamily == 'Ubuntu' {
        $apachepkg = 'apache2'
    } else {
        notify {"Apache is not supported on this distro.":}
    }

    package { 'apache':
        name   => $apachepkg,
        ensure => installed;
    }

}

