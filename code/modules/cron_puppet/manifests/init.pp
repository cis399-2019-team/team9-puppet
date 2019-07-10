class cron_puppet {
    file { 'post-hook':
        ensure  => file,
        path    => '/etc/puppet/.git/hooks/post_merge',
        source  => 'puppet:///code/modules/cron_puppet/post-merge',
        mode    => "0755",
        owner   => root,
        group   => root,
    }
    cron { 'puppet-apply':
        ensure  => present,
        command => "cd /etc/puppet ; /usr/bin/git pull",
        user    => root,
        minute  => '*/30',
        require => File['post-hook'],
    }
}