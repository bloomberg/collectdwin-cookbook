#
# Cookbook: CollectdWin-cookbook
#

Chef.set_resource_priority_array(:windows_package, [ Chef::Resource::WindowsPackage ], os: 'windows')