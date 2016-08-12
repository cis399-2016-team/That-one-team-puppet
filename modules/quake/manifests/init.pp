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
    }

    exec { 'compile_server':
        command => '/home/quake/quake_install/install_server.sh',
        creates => '/home/quake/ioquake3',
        before  => Exec['install_mods'],
        user    => "root",
        require => Package['make', 'gcc'],
    }

    exec { 'install_mods':
        command => '/home/quake/quake_install/install_mods.sh',
        creates => '/home/quake/quake_install/qf3_220_full.zip',
        before  => Exec['start_server'],
        user    => "quake",
        require => Package['unzip'],
    }

    exec { 'start_server':
        command     => '/home/quake/quake_install/start_server.sh',
        user        => "quake",
    }

    ssh_authorized_key { "quake_key_pair":
        user => quake,
        ensure => present,
        type => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDXTTAit5pDTb2DYmAa81ANHbQAN+STtwOXoNYChXsterU9YC4DMLUQDwuozYnDp6oFxYRcgfuZQAvn7mSjOXhlcW3Snh/poLThc3aO/71GGtlWlK9nZaQ60wsIk3bLyc6GWs4Igixu+t4v5p/GOxg1hFx3TwZ13Oc/8vjLQAoPSqQu6NQgv2RVwSfyHR0iWuVeolsIPrBI5xqAZUVtLJm8aVPBaI6FHG/1VCQGVtmOnwUsRcJkVA9GVZxOQi3nuESe5AgMD50exQODQEUo/QXdfxGHP+naC2CHqXr+7yJfYjFSaAGSR2uHd++yPbfkPy3DnPrQFmWIqX5tiootZU25"
    }
}
