#
# == Class: os::params
#
# This class defines various generic, operating system-specific variables which 
# are used by many modules.
#
# On FreeBSD only pkg2ng is supported to keep things simple.
#
class os::params {

    if $osfamily == 'RedHat' {
        $package_install_cmd = 'rpm -i'
        $admingroup = 'root'

    } elsif $osfamily == 'Debian' {
        $package_install_cmd = 'dpkg -i'
        $admingroup = 'root'

    } elsif $osfamily == 'FreeBSD' {
        $package_install_cmd = 'pkg add'
        $admingroup = 'wheel'

    } else {
        fail("Unsupported OS: ${::osfamily}")
    } 
}
