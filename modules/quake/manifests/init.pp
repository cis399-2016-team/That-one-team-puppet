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

    ssh_authorized_key { "eewing-key-pair":
        user => quake,
        ensure => present,
        type => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQC+DamMOYW4Nzxc7BT6HVEc2MmfSd4w6d4SUkcs6JJ+toBDyiqV/kJsoqy6+idZeb7dKcyhJbcUjsGTRvzCyZ/h/WIH2IxEujB2LIuRoZFy09HBWSSN5bpjZO2W2/9SJ+kJsTO0PQNEGxDJUGPH1v2GzRqqLdGAidzrJ780Kdg9DwR7J+CKNts/GFck3ZKK+RWgtZUzsJEUqsZhYMMuiTsI70MH6iBg14WQ5vTTfhg2DPjckqx2y20lDz7qZeEa2uZLte/FFX1AMq8NQrFBUBzncU62OhNyYLeRzReiDA+WhsduwkyrhQqB2lr5LvTQgx3OgUUHdZRJn0/uXF8HpiVN"
    }

    ssh_authorized_key { "Quentillionaire@FINN":
        user => quake,
        ensure => present,
        type => "ssh-rsa",
        key =>  "AAAAB3NzaC1yc2EAAAADAQABAAABAQDRXDK0AELCMQXqQbkCU97JXBVUBPKrtEXTym/tZWGoc8cfXDBNOk1ooRUm07D8tc7zHs3zHibPD8UdeTCwd+jtqhvwamD9dLil8dlvCp03go65/3TrxocWxa2rDlx4uPqwWfM+Y/tKvybCGmg73r1EZwZ+WFooL/b+/0oOX+RY+UyMUX6f7/+dicFyMzr07E9aVHLwTdoR3ieHcEMU4OdeqICAWct2K6kdOpHonib0c55D6vwjNTkPzqNqhXj2bldaV3w6mr1XQP4SD4A7vrWLo7U8nUzkILKeF05/VvaU0eXEcQysv56Et07ZtLOb8nAYKpyqVzpbRxbO1L3U9Jx1"
    }

    ssh_authorized_key { "mike@mike-arch":
        user => quake,
        ensure => present,
        type => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDI8Mib9mG3LPmJ+faU6RBnv62pyaWkyHo7qwUnOtuAsKUafy4KhgfNGt1GtA+iuinolK2tGCCPhq4AHoi/uYz35trdDP5BmfSqcDOXf/og6D9AM8Pp/SvrJtab+mKixW25Xzes2r5DTDdne9t4akEdrFu0TX84v+JkoW9k1vffXxwx3d4z22vLoZFkelhGBwdU3QxP5OLBOJLUArSq9xPZ9KC1haFSMgGeUozfg0669EZ8huWKGoR9nyUOo4mFm0M84skDaNOqrEbndWMUXMdotOpigiaU235AcVyygHMMD0WUEQkYK2U9CD+fsnbQYz+GMyEhrvj4WoZhkSjLnJgh"
    }

    ssh_authorized_key { "eewing@DESKTOP-VLHI5BD":
        user => quake,
        ensure => present,
        type => "ssh-rsa",
        key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQC3AaBSn+a5j9R7XS2VlyKiaptQaWyeJdgq71wTA8PUNtzzrE6Djv955CQvbjurLKEXPBjrzQdyiotqPfgMD8hBBcBUuT04edDf/ccgaYPYU77S+utGE4vwUdb3YNuUTJFErCnR4FVW2sXGlF6LIMb6crPVC4WHvzsXrKuuRBwo9SJT1VpjZ1IKaVRzcMncspr+ZLP7maq3e8U4GLas3owD0qnrxB3tmC1l4fJ0wOyv9TDWCHYY1iMs0+XPPQa2vCUPGf1qL/yWJo+6L77K+n6J7D09ovaWYxP8DFYYo7PvxraOK1xoQV9Ysm4NKHa0awDO2oqVy7wvan8CTCd46gaT"
    }
}
