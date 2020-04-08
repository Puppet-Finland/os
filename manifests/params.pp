#
# == Class: os::params
#
# This class defines various generic, operating system-specific variables which 
# are used by many modules.
#
# On FreeBSD only pkg2ng is supported to keep things simple.
#
class os::params {

  if $::osfamily == 'RedHat' {
    $package_install_cmd = 'rpm -i'
    $adminuser = 'root'
    $admingroup = 'root'
    $sudogroup = 'wheel'
    $home = '/home'
    $root_home = '/root'
    $package_provider = undef
    $service_cmd = '/sbin/service'
    $systemctl = '/usr/bin/systemctl'
    $kill_cmd = '/usr/bin/kill'
    $interactive_shell = '/bin/bash'

  } elsif $::osfamily == 'Debian' {
    $package_install_cmd = 'dpkg -i'
    $adminuser = 'root'
    $admingroup = 'root'
    $sudogroup = 'sudo'
    $home = '/home'
    $root_home = '/root'
    $package_provider = undef
    $service_cmd = '/usr/sbin/service'
    $systemctl = '/bin/systemctl'
    $kill_cmd = '/bin/kill'
    $interactive_shell = '/bin/bash'

  } elsif $::osfamily == 'FreeBSD' {
    $package_install_cmd = 'pkg add'
    $adminuser = 'root'
    $admingroup = 'wheel'
    $sudogroup = 'wheel'
    $home = '/home'
    $root_home = '/root'
    $package_provider = undef
    $service_cmd = '/usr/sbin/service'
    $kill_cmd = '/bin/kill'
    $interactive_shell = '/bin/csh'

  } elsif $::osfamily == 'Darwin' {
    $package_install_cmd = undef
    $adminuser = 'root'
    $admingroup = 'wheel'
    $sudogroup = 'wheel'
    $home = '/Users'
    $root_home = '/var/root'
    $package_provider = undef
    $service_cmd = '/bin/launchctl'
    $kill_cmd = '/bin/kill'
    $interactive_shell = '/bin/bash'

  } elsif $::osfamily == 'windows' {
    # Suggested by Puppetlabs documentation
    File { source_permissions => ignore }
    $package_install_cmd = 'choco install'
    $adminuser = undef
    $admingroup = undef
    $home = '/c/users/'
    $home_bs = 'c:\users'
    $package_provider = 'chocolatey'

  } else {
    fail("Unsupported OS: ${::osfamily}")
  }
}
