#
# == Class: os::params
#
# This class defines various generic, operating system-specific variables which 
# are used by many modules.
#
class os::params {

    if $osfamily == 'RedHat' {

        $admingroup = 'root'

    } elsif $osfamily == 'Debian' {

        $admingroup = 'root'

    } elsif $osfamily == 'FreeBSD' {

        $admingroup = 'wheel'

    } else {

        $admingroup = 'root'

    } 
}
