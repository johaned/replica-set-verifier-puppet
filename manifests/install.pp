# == Class: rsv::install
#
#
class rsv::install {
    include rsv::dependencies

	anchor { 'rsv::install::begin':
	  before => Anchor['rsv::dependencies::begin'],
	}

    anchor { 'rsv::install::end': }

	netinstall { 'rsv':
	  url => $::rsv::params::rsv_repo,
	  extracted_dir => 'replica_set_verifier-0.1.0',
	  destination_dir => '/tmp',
	  postextract_command => 'make && sudo make install',
      require => Anchor['rsv::dependencies::end']
	}
}