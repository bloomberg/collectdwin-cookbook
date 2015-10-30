#
# Cookbook: CollectdWin-cookbook
#

Chef::Resource::WindowsPackage.provides :windows_package_core, os: "windows"
Chef::Provider::Package::Windows.provides :windows_package_core, os: "windows"