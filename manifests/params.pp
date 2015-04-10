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
        $package_provider = undef
        $service_cmd = '/sbin/service'
        $systemctl = '/usr/bin/systemctl'
        $kill_cmd = '/usr/bin/kill'

    } elsif $osfamily == 'Debian' {
        $package_install_cmd = 'dpkg -i'
        $adminuser = 'root'
        $admingroup = 'root'
        $home = '/home'
        $package_provider = undef
        $service_cmd = '/usr/sbin/service'
        $systemctl = '/bin/systemctl'
        $kill_cmd = '/bin/kill'

    } elsif $osfamily == 'FreeBSD' {
        $package_install_cmd = 'pkg add'
        $adminuser = 'root'
        $admingroup = 'wheel'
        $home = '/home'
        $package_provider = undef
        $service_cmd = '/usr/sbin/service'
        $kill_cmd = '/bin/kill'

    } elsif $osfamily == 'windows' {
        # Suggested by Puppetlabs documentation
        File { source_permissions => ignore }
        $package_install_cmd = 'choco install'
        $adminuser = 'BUILTIN\Administrators'
        $admingroup = "${::hostname}\\None"
        $home = '/c/users/'
        $home_bs = 'c:\users'
        $package_provider = 'chocolatey'

    } else {
        fail("Unsupported OS: ${::osfamily}")
    } 
}
