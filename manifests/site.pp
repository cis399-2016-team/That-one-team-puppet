node ip-10-0-5-71 {
    include "sshd"

    cron { "puppet update":
        command => "cd /etc/puppet && git pull -q origin master",
        user    => root,
        minute  => "*/1",
    }

}


node ip-10-0-5-182 {
    include sshd
}

node ip-10-0-5-251 {
    include sshd
    include apache
}
