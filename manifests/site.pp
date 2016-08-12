node ip-10-0-5-71 {
    include sshd
    include users
    include quake

    cron { "puppet update":
        command => "cd /etc/puppet && git pull -q origin master",
        user    => root,
        minute  => "*/1",
    }

}


node ip-10-0-5-226 {
    include sshd
    include apache
    include users
}

node ip-10-0-5-251 {
    include sshd
    include apache
    include users
}
