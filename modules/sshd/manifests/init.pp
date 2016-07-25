class sshd {
package {
"openssh-server": ensure => installed;
}

file { "/etc/ssh/sshd_config":
source  => [
# from modules/sshd/files/$hostname/sshd.conf
#"puppet:///modules/sshd/$hostname/sshd.conf",
# from modules/sshd/files/sshd.conf
"puppet:///modules/sshd/sshd.conf",
],
mode    => 644,
owner   => root,
group   => root,
}
    if $::operatingsystem == 'Amazon' or $::operatingsystem == 'RedHat' {
        $username = 'ec2-user'
        $sshservice = 'sshd'
    } elsif $::operatingsystem == 'Ubuntu' {
        $username = 'ubuntu'
        $sshservice = 'ssh'
    } else {
        notify {"username could not be set":}
    }

    service { "sshd":
        name       => $sshservice,
            # automatically start at boot time
        enable     => true,
            # restart service if it is not running
        ensure     => running,
            # "service sshd status" returns useful service status info
        hasstatus  => true,
            # "service sshd restart" can restart service
        hasrestart => true,
            # package and configuration must be present for service
        require    => [ Package["openssh-server"],
            File["/etc/ssh/sshd_config"] ],
            # changes to configuration cause service restart
        subscribe  => File["/etc/ssh/sshd_config"],

}


    ssh_authorized_key { "eewing-key-pair":
        user => $username,
        type => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQC+DamMOYW4Nzxc7BT6HVEc2MmfSd4w6d4SUkcs6JJ+toBDyiqV/kJsoqy6+idZeb7dKcyhJbcUjsGTRvzCyZ/h/WIH2IxEujB2LIuRoZFy09HBWSSN5bpjZO2W2/9SJ+kJsTO0PQNEGxDJUGPH1v2GzRqqLdGAidzrJ780Kdg9DwR7J+CKNts/GFck3ZKK+RWgtZUzsJEUqsZhYMMuiTsI70MH6iBg14WQ5vTTfhg2DPjckqx2y20lDz7qZeEa2uZLte/FFX1AMq8NQrFBUBzncU62OhNyYLeRzReiDA+WhsduwkyrhQqB2lr5LvTQgx3OgUUHdZRJn0/uXF8HpiVN"
    }

    ssh_authorized_key { "Quentillionaire@FINN":
        user => $username,
        type => "ssh-rsa",
        key =>  "AAAAB3NzaC1yc2EAAAADAQABAAABAQDRXDK0AELCMQXqQbkCU97JXBVUBPKrtEXTym/tZWGoc8cfXDBNOk1ooRUm07D8tc7zHs3zHibPD8UdeTCwd+jtqhvwamD9dLil8dlvCp03go65/3TrxocWxa2rDlx4uPqwWfM+Y/tKvybCGmg73r1EZwZ+WFooL/b+/0oOX+RY+UyMUX6f7/+dicFyMzr07E9aVHLwTdoR3ieHcEMU4OdeqICAWct2K6kdOpHonib0c55D6vwjNTkPzqNqhXj2bldaV3w6mr1XQP4SD4A7vrWLo7U8nUzkILKeF05/VvaU0eXEcQysv56Et07ZtLOb8nAYKpyqVzpbRxbO1L3U9Jx1"
    }

    ssh_authorized_key { "mike@mike-arch":
        user => $username,
        type => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDI8Mib9mG3LPmJ+faU6RBnv62pyaWkyHo7qwUnOtuAsKUafy4KhgfNGt1GtA+iuinolK2tGCCPhq4AHoi/uYz35trdDP5BmfSqcDOXf/og6D9AM8Pp/SvrJtab+mKixW25Xzes2r5DTDdne9t4akEdrFu0TX84v+JkoW9k1vffXxwx3d4z22vLoZFkelhGBwdU3QxP5OLBOJLUArSq9xPZ9KC1haFSMgGeUozfg0669EZ8huWKGoR9nyUOo4mFm0M84skDaNOqrEbndWMUXMdotOpigiaU235AcVyygHMMD0WUEQkYK2U9CD+fsnbQYz+GMyEhrvj4WoZhkSjLnJgh"
    }

    ssh_authorized_key { "Quent@DESKTOP-VLHI5BD":
        user => $username,
        type => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQC3AaBSn+a5j9R7XS2VlyKiaptQaWyeJdgq71wTA8PUNtzzrE6Djv955CQvbjurLKEXPBjrzQdyiotqPfgMD8hBBcBUuT04edDf/ccgaYPYU77S+utGE4vwUdb3YNuUTJFErCnR4FVW2sXGlF6LIMb6crPVC4WHvzsXrKuuRBwo9SJT1VpjZ1IKaVRzcMncspr+ZLP7maq3e8U4GLas3owD0qnrxB3tmC1l4fJ0wOyv9TDWCHYY1iMs0+XPPQa2vCUPGf1qL/yWJo+6L77K+n6J7D09ovaWYxP8DFYYo7PvxraOK1xoQV9Ysm4NKHa0awDO2oqVy7wvan8CTCd46gaT"
    }

}
