class sshd {
package {
"openssh-server": ensure => installed;
}

file { "/etc/ssh/sshd_config":
source  => [
# from modules/smartd/files/$hostname/smartd.conf
#"puppet:///modules/sshd/$hostname/sshd.conf",
# from modules/smartd/files/smartd.conf
"puppet:///modules/sshd/sshd.conf",
],
mode    => 644,
owner   => root,
group   => root,
}

service { "sshd":
# automatically start at boot time
enable     => true,
# restart service if it is not running
ensure     => running,
# "service smartd status" returns useful service status info
hasstatus  => true,
# "service smartd restart" can restart service
hasrestart => true,
# package and configuration must be present for service
require    => [ Package["openssh-server"],
        File["/etc/ssh/sshd_config"] ],
# changes to configuration cause service restart
subscribe  => File["/etc/ssh/sshd_config"],

}

    ssh_authorized_key { "eewing-key-pair":
        user => "ec2-user",
        type => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQC+DamMOYW4Nzxc7BT6HVEc2MmfSd4w6d4SUkcs6JJ+toBDyiqV/kJsoqy6+idZeb7dKcyhJbcUjsGTRvzCyZ/h/WIH2IxEujB2LIuRoZFy09HBWSSN5bpjZO2W2/9SJ+kJsTO0PQNEGxDJUGPH1v2GzRqqLdGAidzrJ780Kdg9DwR7J+CKNts/GFck3ZKK+RWgtZUzsJEUqsZhYMMuiTsI70MH6iBg14WQ5vTTfhg2DPjckqx2y20lDz7qZeEa2uZLte/FFX1AMq8NQrFBUBzncU62OhNyYLeRzReiDA+WhsduwkyrhQqB2lr5LvTQgx3OgUUHdZRJn0/uXF8HpiVN eewing-key-pair"
    }

    ssh_authorized_key { "Quentillionaire@FINN":
        user => "ec2-user",
        type => "ssh-rsa",
        key =>  "AAAAB3NzaC1yc2EAAAADAQABAAABAQDRXDK0AELCMQXqQbkCU97JXBVUBPKrtEXTym/tZWGoc8cfXDBNOk1ooRUm07D8tc7zHs3zHibPD8UdeTCwd+jtqhvwamD9dLil8dlvCp03go65/3TrxocWxa2rDlx4uPqwWfM+Y/tKvybCGmg73r1EZwZ+WFooL/b+/0oOX+RY+UyMUX6f7/+dicFyMzr07E9aVHLwTdoR3ieHcEMU4OdeqICAWct2K6kdOpHonib0c55D6vwjNTkPzqNqhXj2bldaV3w6mr1XQP4SD4A7vrWLo7U8nUzkILKeF05/VvaU0eXEcQysv56Et07ZtLOb8nAYKpyqVzpbRxbO1L3U9Jx1 Quentillionaire@FINN"
    }

    ssh_authorized_key { "mike@mike-arch":
        user => "ec2-user",
        type => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDI8Mib9mG3LPmJ+faU6RBnv62pyaWkyHo7qwUnOtuAsKUafy4KhgfNGt1GtA+iuinolK2tGCCPhq4AHoi/uYz35trdDP5BmfSqcDOXf/og6D9AM8Pp/SvrJtab+mKixW25Xzes2r5DTDdne9t4akEdrFu0TX84v+JkoW9k1vffXxwx3d4z22vLoZFkelhGBwdU3QxP5OLBOJLUArSq9xPZ9KC1haFSMgGeUozfg0669EZ8huWKGoR9nyUOo4mFm0M84skDaNOqrEbndWMUXMdotOpigiaU235AcVyygHMMD0WUEQkYK2U9CD+fsnbQYz+GMyEhrvj4WoZhkSjLnJgh mike@mike-arch"
    }

    ssh_authorized_key { "Quent@DESKTOP-ER46L4L":
        user => "ec2-user",
        type => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCjLSZjv6S8XRccQVhYeIBQaioPCk0yDnawtpjm5H85bFTBBEBLbAf984ROzg/f7L0eUN5cowON1N+qJHCoAYm7PGxctMjpqnjzWmX49TgnT1c3dt8iGbee/dQZx5FxD3fIYqGjrlDvLFG9PrnpYv3t3UitWGHQkns40UZr98kova0u8ugi31NHvs54K/AYNbmu586OYTlbBuFUtJJoiCcfa1FeAjhXSTpRyCWkZfMLRO7sxKecHaChpdysZkyscpW8v6wjj7iZYmmyJdIPUD27kZMfT5+Nl/3rYZbG3M4Pili2I+px8EYZpK5RQjcCLNULtLsutz0wk7ac009SGJ4r Quent@DESKTOP-ER46L4L"
    }

}
