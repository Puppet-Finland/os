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
        $adminuser = 'root'
        $admingroup = 'root'
        $home = '/home'

    } elsif $osfamily == 'Debian' {
        $package_install_cmd = 'dpkg -i'
        $adminuser = 'root'
        $admingroup = 'root'
        $home = '/home'

    } elsif $osfamily == 'FreeBSD' {
        $package_install_cmd = 'pkg add'
        $adminuser = 'root'
        $admingroup = 'wheel'
        $home = '/home'

    } elsif $osfamily == 'windows' {
        $package_install_cmd = 'choco install'
        $adminuser = 'Administrator'
        $admingroup = 'Administrators'
        $home = '/c/users/'
        $home_bs = 'c:\users'

    } else {
        fail("Unsupported OS: ${::osfamily}")
    } 
}
