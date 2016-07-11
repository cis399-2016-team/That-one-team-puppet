class sshd {
    package {
        "ssh": ensure => installed
    }
    
    service { "sshd": 
        enable => true,
        ensure => running,
        hasrestart => true,
        subscribe => File["/etc/ssh/sshd_config"],
        require => Package["openssh-server"]
    }

    ssh_authorized_key { "eewing_key":
        user => "ubuntu",
        key => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDRXDK0AELCMQXqQbkCU97JXBVUBPKrtEXTym/tZWGoc8cfXDBNOk1ooRUm07D8tc7zHs3zHibPD8UdeTCwd+jtqhvwamD9dLil8dlvCp03go65/3TrxocWxa2rDlx4uPqwWfM+Y/tKvybCGmg73r1EZwZ+WFooL/b+/0oOX+RY+UyMUX6f7/+dicFyMzr07E9aVHLwTdoR3ieHcEMU4OdeqICAWct2K6kdOpHonib0c55D6vwjNTkPzqNqhXj2bldaV3w6mr1XQP4SD4A7vrWLo7U8nUzkILKeF05/VvaU0eXEcQysv56Et07ZtLOb8nAYKpyqVzpbRxbO1L3U9Jx1 Quentillionaire@FINN"
    }

    ssh_authorized_key { "mike_key":
        user => "ubuntu",
        key => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDW6KxhZQURLzasQlBObJxCMYmAZgezXPC0buM3e5h2GaTdpOAGAgHM4CVqUnNjIEEQX0lWAOju+JLQma4QzFaCUNcTJXvnrTK+XqDr3GkdhrQdGKWcS/1BHN1mrHwGymOmL7TiVJyhDRd/dhAEkOH3nukGOkErVJmsnc30PnlOtYReEZYGkzFNW9mNBoQJupU/1huiIBLjXDlVUaqDn5CQ03WFiHaK1O6V+Pg+AJ8rNXhFesF/Mlmvpal3G1yqREDHFvr4skQdBrpIxFXhDCi2s1M7kghKtlueYqFe4EmTVZ8r5C50NZiqoRVpEUXxTKOqQodL/UaR0aWo9U2QqWJx panda
"
    }

}
