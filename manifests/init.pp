# == Class: replica-set-verifier
#
# Full description of class set-verifier here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { replica-set-verifier:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Johan Tique <johan.tique@codescrum.com>
#
# === Copyright
#
# Copyright 2014 Johan Tique.
#
class replica-set-verifier inherits replica-set-verifier::params{
	anchor{ 'replica-set-verifier::begin':
		before => Anchor['replica-set-verifier::install::begin'],
	}

	anchor { 'replica-set-verifier::end': }
}
