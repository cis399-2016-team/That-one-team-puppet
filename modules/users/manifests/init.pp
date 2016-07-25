define useradd($name, $uid, $ssh_key_name, $ssh_key) {

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


useradd { "chenders": 
	name => "chenders", 
	uid => 1001,
	ssh_key_name => "chenders-key-pair-oregon",
	ssh_key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCWR1HbA7kQtEHE2qHTQnuTNsEGQtz8cMg5HID4WaMwOdNKGYR4ARmXHhI6Lpn2/kQ97ay2j1M1tYZhJSsglqrsGRY+gxEyr3Yp5Aq4KVLqYEnvHV5cfRbpekD3zGULH2dri8C/c/Z8ASBNHmm3deLz1IiB2IetTZ3fCS3VAqvlEF6WIbXw13j5kGGHbPG/TFevdKXwQTAK75P1LaNx00vjTHPP03/nmwRItl3lLuYS8RXyrOtmJR/oxCWqu+WZCBV5Dz37idScZ/kwrbjaDNTBrydC5lArn2x6m2r9JIn5cjI7hf3FZAfOkXSivxBTlpZ3hYW41XvHewLo3kKVIamX"
}

}
