class apache {

    if $::osfamily == 'RedHat' {
        $apachepkg = 'httpd'
    elseif $::osfamily == 'Ubuntu' {
        $apachepkg = 'apache2'
    } else {
        print "Apache is not supported on this distro."
    }

    package { 'apache':
        name   => $apachepkg,
        ensure => installed;
    }

}

