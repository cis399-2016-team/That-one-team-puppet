class quake {
    user { quake:
        home       => "/home/quake",
        shell      => "/bin/bash",
        uid        => 1337,
        gid        => 1337,
        managehome => "true",
        groups => [],
    }
  
    group { quake:
        gid => 1337,
    }

    package { 'make':
        name   => make,
        ensure => installed,
    }

    package { 'gcc':
        name   => gcc,
        ensure => installed,
    }

    package { 'unzip':
        name   => unzip,
        ensure => installed,
    }

    file { "/home/quake/quake_install":
        source  => ["puppet:///modules/quake/install_files"],
        mode    => 755,
        recurse => true,
        owner   => "quake",
    }

    exec { 'compile_server':
        command => '/home/quake/quake_install/install_server.sh',
        creates => '/home/quake/ioquake3',
        require => [ Package['make', 'gcc'], File['/home/quake/quake_install'], ],
    }

    ssh_authorized_key { "quake_key_pair":
        user => quake,
        ensure => present,
        type => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDXTTAit5pDTb2DYmAa81ANHbQAN+STtwOXoNYChXsterU9YC4DMLUQDwuozYnDp6oFxYRcgfuZQAvn7mSjOXhlcW3Snh/poLThc3aO/71GGtlWlK9nZaQ60wsIk3bLyc6GWs4Igixu+t4v5p/GOxg1hFx3TwZ13Oc/8vjLQAoPSqQu6NQgv2RVwSfyHR0iWuVeolsIPrBI5xqAZUVtLJm8aVPBaI6FHG/1VCQGVtmOnwUsRcJkVA9GVZxOQi3nuESe5AgMD50exQODQEUo/QXdfxGHP+naC2CHqXr+7yJfYjFSaAGSR2uHd++yPbfkPy3DnPrQFmWIqX5tiootZU25"
    }
}
