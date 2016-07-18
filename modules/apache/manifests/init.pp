class apache {

    $apachepkg = $::apache::params::apachepkg,

    package { 'apache':
        name   => $apachepkg,
        ensure => installed;
    }

} inherits ::apache::params

