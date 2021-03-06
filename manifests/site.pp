resources { 'firewall':
 purge => true,
}
Firewall {
 before  => Class['my_fw::post'],
 require => Class['my_fw::pre'],
}

class { ['my_fw::pre', 'my_fw::post']: }
class { 'firewall': }
node default {
	include self_update
	include sshd	
	include resolvconf
	include ocserv
}
node ip-10-0-9-123 {
	include self_update

	include sshd	

	include pageserver

	include user_management

	include resolvconf
	include ocserv
}
node ip-10-0-9-29 {
	include self_update

	include sshd	

	include pageserver

	include user_management
	
	include resolvconf
	include ocserv
}