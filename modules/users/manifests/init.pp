define useradd($name, $uid, $ssh_key_type, $ssh_key) {

    user { "$name":
        home       => "/home/$name",
        shell      => "/bin/bash",
        uid        => $uid,
        gid        => $uid,
        managehome => "true",
        groups => [],
    }
  
    group { "$name":
        gid => $uid,
    }
   
    ssh_authorized_key { "$ssh_key_name":
        user   => $name,
        ensure => present,
        type   => "ssh-rsa",
        key    => $ssh_key,
    }
    
}

class users {


useradd { "eewing": 
	name => "eewing", 
	uid => 1001,
	ssh_key_name => "eewing@DESKTOP-VLHI5BD",
	ssh_key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQC3AaBSn+a5j9R7XS2VlyKiaptQaWyeJdgq71wTA8PUNtzzrE6Djv955CQvbjurLKEXPBjrzQdyiotqPfgMD8hBBcBUuT04edDf/ccgaYPYU77S+utGE4vwUdb3YNuUTJFErCnR4FVW2sXGlF6LIMb6crPVC4WHvzsXrKuuRBwo9SJT1VpjZ1IKaVRzcMncspr+ZLP7maq3e8U4GLas3owD0qnrxB3tmC1l4fJ0wOyv9TDWCHYY1iMs0+XPPQa2vCUPGf1qL/yWJo+6L77K+n6J7D09ovaWYxP8DFYYo7PvxraOK1xoQV9Ysm4NKHa0awDO2oqVy7wvan8CTCd46gaT"
}

}
