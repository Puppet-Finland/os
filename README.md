[![Build Status](https://travis-ci.org/Puppet-Finland/puppet-os.svg?branch=master)](https://travis-ci.org/Puppet-Finland/puppet-os)

# os

A support module that contains operating system-specific parameters for use in 
other modules. All the interesting stuff is in ::os::params.

# Module usage

To use this module just

    include ::os

and make use of the parameters in [::os::params](manifests/params.pp)
