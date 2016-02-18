#
# Cookbook: collectdwin-cookbook
#

# windows_package is defined in 2 places,
# one in chef-cookbooks (https://github.com/chef-cookbooks/windows/blob/master/libraries/windows_package.rb)
# and another in chef core (https://docs.chef.io/resource_windows_package.html)
# When windows_package from chef-cookbooks was used, new versions failed to install.
# windows_package from chef core works well, so forcing it to be used
Chef::Resource::WindowsPackage.provides :windows_package_core, os: 'windows'
Chef::Provider::Package::Windows.provides :windows_package_core, os: 'windows'
