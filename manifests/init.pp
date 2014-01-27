# == Class: rsv
# This class provisioning the mongo-c-driver, libbson and replica_set_verifier service
#
# === Examples
#
#  class { rsv:
#  }
#
#  or
#
#  include rsv
#
# === Authors
#
# Johan Tique <johan.tique@codescrum.com>
#
# === Copyright
#
# Copyright 2014 Johan Tique.
#
class rsv inherits rsv::params{
    include rsv::install

	anchor{ 'rsv::begin':
		before => Anchor["rsv::install::begin"],
	}

	anchor { 'rsv::end': }

    file {
      "/etc/replica_set_verifier.conf":
        content => template('rsv/replica_set_verifier.conf.erb'),
        mode    => '0755',
        require => Class['rsv::install'];
      "/etc/init.d/replica_set_verifier":
        content => template('rsv/replica_set_verifier-init.conf.erb'),
        mode    => '0755',
        require => Class['rsv::install'];
      "/etc/init.d/serviwer":
        content => template('rsv/serviwer-init.conf.erb'),
        mode    => '0755',
        require => Class['rsv::install'],
    }

    service { "replica_set_verifier":
      enable     => 'true',
      ensure     => 'running',
      hasstatus  => true,
      hasrestart => true,
      require    => [
        File["/etc/replica_set_verifier.conf", "/etc/init.d/replica_set_verifier"],
      ],
      before     => Anchor['rsv::end']
    }

    service { "serviwer":
      enable     => 'true',
      ensure     => 'running',
      hasstatus  => true,
      hasrestart => true,
      require    => [
      File["/etc/init.d/serviwer"],
      ],
      before     => Anchor['rsv::end']
    }
}
