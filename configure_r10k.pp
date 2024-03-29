######         ######
##  Configure R10k ##
######         ######

##  This manifest requires the zack/R10k module and will attempt to
##  configure R10k according to my blog post on directory environments.
##  Beware! (and good luck!)
##  http://garylarizza.com/blog/2014/02/18/puppet-workflow-part-3/

## version should correspond to the Gem version zack-r10k is tested against:
## https://forge.puppetlabs.com/zack/r10k
## (e.g. 1.5.1 for recent module versions, expected to be 2.0.3 at the next major zack-r10k release)
# puppet apply --verbose configure_r10k.pp
# r10k deploy environment -pv

class { 'r10k':
  version           => '1.5.1',
  sources           => {
    'puppet' => {
      'remote'  => 'https://github.com/furhouse/puppet-playground.git',
      'basedir' => "${::settings::confdir}/environments",
      'prefix'  => false,
    }
  },
  ## purgedirs is deprecated, but may be needed for older versions (see https://github.com/acidprime/r10k/pull/84)
  ## purgedirs         => ["${::settings::confdir}/environments"],
  manage_modulepath => false,
}
