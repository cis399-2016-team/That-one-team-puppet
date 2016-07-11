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


}
