class apache {

    notify {"Your os family is $::operatingsystem":}

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

}

